import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;
import 'package:ionic/core/utils/errors/failure.dart';

import 'package:ionic/features/address/domain/entity/address_entity.dart';

import 'package:latlong2/latlong.dart';

import '../../domain/repo/address_repo.dart';
import '../data_source/address_remote_data_source.dart';

class AddressRepoImpl implements AddressRepo {
  final loc.Location _location;
  final AddressRemoteDataSource _remote;

  AddressRepoImpl(this._location, this._remote);

  @override
  Future<Either<Failure, void>> addUserAddress(
    AddressEntity addressEntity,
  ) async {
    try {
      await _remote.addAddress(addressEntity.toModel());
      return const Right(null);
    } catch (e) {
      return const Left(Failure("Failed to add address"));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAddress(String addressId) async {
    try {
      await _remote.deleteAddress(addressId);
      return const Right(null);
    } catch (e) {
      return const Left(Failure("Failed to delete address"));
    }
  }

  @override
  Future<Either<Failure, List<AddressEntity>>> fetchAddresses() async {
    try {
      final response = await _remote.getAddresses();
      return Right(response);
    } catch (e) {
      return const Left(Failure("Failed to fetch addresses"));
    }
  }

  @override
  Future<Either<Failure, void>> updateAddress(
    AddressEntity addressEntity,
  ) async {
    try {
      await _remote.updateAddress(addressEntity.toModel());
      return const Right(null);
    } catch (e) {
      return const Left(Failure("Failed to update address"));
    }
  }

  @override
  Future<Either<Failure, String>> getAddressFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    try {
      final placeMarks = await placemarkFromCoordinates(latitude, longitude);
      if (placeMarks.isEmpty) return const Left(Failure("Address not found"));

      final place = placeMarks.first;
      final addressParts =
          [
            place.name,
            place.locality,
            place.administrativeArea,
            place.country,
          ].where((part) => part != null && part.isNotEmpty).toList();

      final address = addressParts.join(', ');

      return Right(address);
    } catch (e) {
      return Left(Failure("Failed to get address: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, LatLng>> getUserCoordinates() async {
    try {
      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) {
          return const Left(Failure("Location services disabled"));
        }
      }

      loc.PermissionStatus permission = await _location.hasPermission();
      if (permission == loc.PermissionStatus.denied) {
        permission = await _location.requestPermission();
        if (permission == loc.PermissionStatus.denied) {
          return const Left(Failure("Location permission denied"));
        }
      }

      if (permission == loc.PermissionStatus.deniedForever) {
        return const Left(
          Failure(
            "Location permissions are permanently denied. Please enable them in settings.",
          ),
        );
      }

      final locData = await _location.getLocation();
      final lat = locData.latitude;
      final lng = locData.longitude;

      if (lat == null || lng == null) {
        return const Left(Failure("Failed to retrieve coordinates"));
      }

      return Right(LatLng(lat, lng));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
