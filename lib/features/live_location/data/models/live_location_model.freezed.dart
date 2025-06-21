// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LiveLocationModel _$LiveLocationModelFromJson(Map<String, dynamic> json) {
  return _LiveLocationModel.fromJson(json);
}

/// @nodoc
mixin _$LiveLocationModel {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this LiveLocationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiveLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveLocationModelCopyWith<LiveLocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveLocationModelCopyWith<$Res> {
  factory $LiveLocationModelCopyWith(
    LiveLocationModel value,
    $Res Function(LiveLocationModel) then,
  ) = _$LiveLocationModelCopyWithImpl<$Res, LiveLocationModel>;
  @useResult
  $Res call({
    double lat,
    double lng,
    String userId,
    String orderId,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$LiveLocationModelCopyWithImpl<$Res, $Val extends LiveLocationModel>
    implements $LiveLocationModelCopyWith<$Res> {
  _$LiveLocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
    Object? userId = null,
    Object? orderId = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            lat:
                null == lat
                    ? _value.lat
                    : lat // ignore: cast_nullable_to_non_nullable
                        as double,
            lng:
                null == lng
                    ? _value.lng
                    : lng // ignore: cast_nullable_to_non_nullable
                        as double,
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String,
            orderId:
                null == orderId
                    ? _value.orderId
                    : orderId // ignore: cast_nullable_to_non_nullable
                        as String,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LiveLocationModelImplCopyWith<$Res>
    implements $LiveLocationModelCopyWith<$Res> {
  factory _$$LiveLocationModelImplCopyWith(
    _$LiveLocationModelImpl value,
    $Res Function(_$LiveLocationModelImpl) then,
  ) = __$$LiveLocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double lat,
    double lng,
    String userId,
    String orderId,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$LiveLocationModelImplCopyWithImpl<$Res>
    extends _$LiveLocationModelCopyWithImpl<$Res, _$LiveLocationModelImpl>
    implements _$$LiveLocationModelImplCopyWith<$Res> {
  __$$LiveLocationModelImplCopyWithImpl(
    _$LiveLocationModelImpl _value,
    $Res Function(_$LiveLocationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LiveLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
    Object? userId = null,
    Object? orderId = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$LiveLocationModelImpl(
        lat:
            null == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                    as double,
        lng:
            null == lng
                ? _value.lng
                : lng // ignore: cast_nullable_to_non_nullable
                    as double,
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveLocationModelImpl implements _LiveLocationModel {
  const _$LiveLocationModelImpl({
    required this.lat,
    required this.lng,
    required this.userId,
    required this.orderId,
    required this.updatedAt,
  });

  factory _$LiveLocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveLocationModelImplFromJson(json);

  @override
  final double lat;
  @override
  final double lng;
  @override
  final String userId;
  @override
  final String orderId;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'LiveLocationModel(lat: $lat, lng: $lng, userId: $userId, orderId: $orderId, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveLocationModelImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lat, lng, userId, orderId, updatedAt);

  /// Create a copy of LiveLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveLocationModelImplCopyWith<_$LiveLocationModelImpl> get copyWith =>
      __$$LiveLocationModelImplCopyWithImpl<_$LiveLocationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveLocationModelImplToJson(this);
  }
}

abstract class _LiveLocationModel implements LiveLocationModel {
  const factory _LiveLocationModel({
    required final double lat,
    required final double lng,
    required final String userId,
    required final String orderId,
    required final DateTime updatedAt,
  }) = _$LiveLocationModelImpl;

  factory _LiveLocationModel.fromJson(Map<String, dynamic> json) =
      _$LiveLocationModelImpl.fromJson;

  @override
  double get lat;
  @override
  double get lng;
  @override
  String get userId;
  @override
  String get orderId;
  @override
  DateTime get updatedAt;

  /// Create a copy of LiveLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveLocationModelImplCopyWith<_$LiveLocationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
