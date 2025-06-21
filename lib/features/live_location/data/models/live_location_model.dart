import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_location_model.freezed.dart';
part 'live_location_model.g.dart';

@freezed
class LiveLocationModel with _$LiveLocationModel {
  const factory LiveLocationModel({
    required double lat,
    required double lng,
    required String userId,
    required String orderId,
    required DateTime updatedAt,
  }) = _LiveLocationModel;

  factory LiveLocationModel.fromJson(Map<String, dynamic> json) =>
      _$LiveLocationModelFromJson(json);
}
