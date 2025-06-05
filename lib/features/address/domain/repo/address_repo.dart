import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/utils/errors/failure.dart';
import '../entity/address_entity.dart';

abstract class AddressRepo {
  Future<Either<Failure, LatLng>> getUserCoordinates();
  Future<Either<Failure, String>> getAddressFromCoordinates(
    double latitude,
    double longitude,
  );

  Future<Either<Failure, void>> addUserAddress(AddressEntity addressEntity);
  Future<Either<Failure, void>> updateAddress(AddressEntity addressEntity);
  Future<Either<Failure, void>> deleteAddress(String addressId);
  Future<Either<Failure, List<AddressEntity>>> fetchAddresses();
}
