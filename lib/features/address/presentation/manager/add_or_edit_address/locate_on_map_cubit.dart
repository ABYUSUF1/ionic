import 'package:bloc/bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/address/domain/repo/address_repo.dart';
import 'package:latlong2/latlong.dart';

part 'locate_on_map_state.dart';
part 'locate_on_map_cubit.freezed.dart';

class LocateOnMapCubit extends Cubit<LocateOnMapState> {
  final AddressRepo _addressRepo;
  final MapController mapController = MapController();
  LocateOnMapCubit(this._addressRepo) : super(const LocateOnMapState.initial());

  Future<void> getLocationAndAddress() async {
    emit(const LocateOnMapState.loading());

    final coordinatesResult = await _addressRepo.getUserCoordinates();
    coordinatesResult.fold(
      (failure) => emit(LocateOnMapState.error(failure.errMessage)),
      (latLng) async {
        final addressResult = await _addressRepo.getAddressFromCoordinates(
          latLng.latitude,
          latLng.longitude,
        );
        addressResult.fold(
          (failure) => emit(LocateOnMapState.error(failure.errMessage)),
          (address) {
            mapController.move(latLng, 15); // move to user location
            emit(LocateOnMapState.success(address, latLng));
          },
        );
      },
    );
  }

  @override
  Future<void> close() {
    mapController.dispose();
    return super.close();
  }
}
