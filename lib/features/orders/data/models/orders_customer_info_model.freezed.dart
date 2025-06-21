// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_customer_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrdersCustomerInfoModel _$OrdersCustomerInfoModelFromJson(
  Map<String, dynamic> json,
) {
  return _OrdersCustomerInfoModel.fromJson(json);
}

/// @nodoc
mixin _$OrdersCustomerInfoModel {
  String get userId => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  AddressTypeEnum get addressType => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  /// Serializes this OrdersCustomerInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrdersCustomerInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrdersCustomerInfoModelCopyWith<OrdersCustomerInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersCustomerInfoModelCopyWith<$Res> {
  factory $OrdersCustomerInfoModelCopyWith(
    OrdersCustomerInfoModel value,
    $Res Function(OrdersCustomerInfoModel) then,
  ) = _$OrdersCustomerInfoModelCopyWithImpl<$Res, OrdersCustomerInfoModel>;
  @useResult
  $Res call({
    String userId,
    String fullName,
    String phoneNumber,
    String address,
    AddressTypeEnum addressType,
    double lat,
    double lng,
  });
}

/// @nodoc
class _$OrdersCustomerInfoModelCopyWithImpl<
  $Res,
  $Val extends OrdersCustomerInfoModel
>
    implements $OrdersCustomerInfoModelCopyWith<$Res> {
  _$OrdersCustomerInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrdersCustomerInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? fullName = null,
    Object? phoneNumber = null,
    Object? address = null,
    Object? addressType = null,
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(
      _value.copyWith(
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String,
            fullName:
                null == fullName
                    ? _value.fullName
                    : fullName // ignore: cast_nullable_to_non_nullable
                        as String,
            phoneNumber:
                null == phoneNumber
                    ? _value.phoneNumber
                    : phoneNumber // ignore: cast_nullable_to_non_nullable
                        as String,
            address:
                null == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
                        as String,
            addressType:
                null == addressType
                    ? _value.addressType
                    : addressType // ignore: cast_nullable_to_non_nullable
                        as AddressTypeEnum,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrdersCustomerInfoModelImplCopyWith<$Res>
    implements $OrdersCustomerInfoModelCopyWith<$Res> {
  factory _$$OrdersCustomerInfoModelImplCopyWith(
    _$OrdersCustomerInfoModelImpl value,
    $Res Function(_$OrdersCustomerInfoModelImpl) then,
  ) = __$$OrdersCustomerInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    String fullName,
    String phoneNumber,
    String address,
    AddressTypeEnum addressType,
    double lat,
    double lng,
  });
}

/// @nodoc
class __$$OrdersCustomerInfoModelImplCopyWithImpl<$Res>
    extends
        _$OrdersCustomerInfoModelCopyWithImpl<
          $Res,
          _$OrdersCustomerInfoModelImpl
        >
    implements _$$OrdersCustomerInfoModelImplCopyWith<$Res> {
  __$$OrdersCustomerInfoModelImplCopyWithImpl(
    _$OrdersCustomerInfoModelImpl _value,
    $Res Function(_$OrdersCustomerInfoModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrdersCustomerInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? fullName = null,
    Object? phoneNumber = null,
    Object? address = null,
    Object? addressType = null,
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(
      _$OrdersCustomerInfoModelImpl(
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        fullName:
            null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                    as String,
        phoneNumber:
            null == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                    as String,
        address:
            null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as String,
        addressType:
            null == addressType
                ? _value.addressType
                : addressType // ignore: cast_nullable_to_non_nullable
                    as AddressTypeEnum,
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrdersCustomerInfoModelImpl implements _OrdersCustomerInfoModel {
  const _$OrdersCustomerInfoModelImpl({
    required this.userId,
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.addressType,
    required this.lat,
    required this.lng,
  });

  factory _$OrdersCustomerInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrdersCustomerInfoModelImplFromJson(json);

  @override
  final String userId;
  @override
  final String fullName;
  @override
  final String phoneNumber;
  @override
  final String address;
  @override
  final AddressTypeEnum addressType;
  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'OrdersCustomerInfoModel(userId: $userId, fullName: $fullName, phoneNumber: $phoneNumber, address: $address, addressType: $addressType, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersCustomerInfoModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.addressType, addressType) ||
                other.addressType == addressType) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    fullName,
    phoneNumber,
    address,
    addressType,
    lat,
    lng,
  );

  /// Create a copy of OrdersCustomerInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrdersCustomerInfoModelImplCopyWith<_$OrdersCustomerInfoModelImpl>
  get copyWith => __$$OrdersCustomerInfoModelImplCopyWithImpl<
    _$OrdersCustomerInfoModelImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrdersCustomerInfoModelImplToJson(this);
  }
}

abstract class _OrdersCustomerInfoModel implements OrdersCustomerInfoModel {
  const factory _OrdersCustomerInfoModel({
    required final String userId,
    required final String fullName,
    required final String phoneNumber,
    required final String address,
    required final AddressTypeEnum addressType,
    required final double lat,
    required final double lng,
  }) = _$OrdersCustomerInfoModelImpl;

  factory _OrdersCustomerInfoModel.fromJson(Map<String, dynamic> json) =
      _$OrdersCustomerInfoModelImpl.fromJson;

  @override
  String get userId;
  @override
  String get fullName;
  @override
  String get phoneNumber;
  @override
  String get address;
  @override
  AddressTypeEnum get addressType;
  @override
  double get lat;
  @override
  double get lng;

  /// Create a copy of OrdersCustomerInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrdersCustomerInfoModelImplCopyWith<_$OrdersCustomerInfoModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
