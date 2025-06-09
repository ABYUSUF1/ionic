part of 'locate_on_map_cubit.dart';

@freezed
class LocateOnMapState with _$LocateOnMapState {
  const factory LocateOnMapState.initial() = _Initial;
  const factory LocateOnMapState.loading() = _Loading;
  const factory LocateOnMapState.success(String fullAddress, LatLng location) =
      _Success;
  const factory LocateOnMapState.error(String errMessage) = _Error;
}

extension LocateOnMapStateX on LocateOnMapState {
  bool get isInitial => this is _Initial;
  bool get isLoading => this is _Loading;
  bool get isSuccess => this is _Success;
  bool get isError => this is _Error;
}
