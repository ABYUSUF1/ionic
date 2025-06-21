// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrdersModel _$OrdersModelFromJson(Map<String, dynamic> json) {
  return _OrdersModel.fromJson(json);
}

/// @nodoc
mixin _$OrdersModel {
  String get orderId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  List<OrdersProductModel> get products => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  int get totalQuantity => throw _privateConstructorUsedError;
  PaymentMethodEnum get paymentMethod => throw _privateConstructorUsedError;
  DeliveryInstructionsEnum get deliveryInstructions =>
      throw _privateConstructorUsedError;
  OrderStatusEnum get orderStatus => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get arrivedAt => throw _privateConstructorUsedError;

  /// Serializes this OrdersModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrdersModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrdersModelCopyWith<OrdersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersModelCopyWith<$Res> {
  factory $OrdersModelCopyWith(
    OrdersModel value,
    $Res Function(OrdersModel) then,
  ) = _$OrdersModelCopyWithImpl<$Res, OrdersModel>;
  @useResult
  $Res call({
    String orderId,
    String userId,
    String firstName,
    String lastName,
    String phoneNumber,
    String address,
    List<OrdersProductModel> products,
    double totalPrice,
    int totalQuantity,
    PaymentMethodEnum paymentMethod,
    DeliveryInstructionsEnum deliveryInstructions,
    OrderStatusEnum orderStatus,
    DateTime createdAt,
    DateTime arrivedAt,
  });
}

/// @nodoc
class _$OrdersModelCopyWithImpl<$Res, $Val extends OrdersModel>
    implements $OrdersModelCopyWith<$Res> {
  _$OrdersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrdersModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? userId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phoneNumber = null,
    Object? address = null,
    Object? products = null,
    Object? totalPrice = null,
    Object? totalQuantity = null,
    Object? paymentMethod = null,
    Object? deliveryInstructions = null,
    Object? orderStatus = null,
    Object? createdAt = null,
    Object? arrivedAt = null,
  }) {
    return _then(
      _value.copyWith(
            orderId:
                null == orderId
                    ? _value.orderId
                    : orderId // ignore: cast_nullable_to_non_nullable
                        as String,
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String,
            firstName:
                null == firstName
                    ? _value.firstName
                    : firstName // ignore: cast_nullable_to_non_nullable
                        as String,
            lastName:
                null == lastName
                    ? _value.lastName
                    : lastName // ignore: cast_nullable_to_non_nullable
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
            products:
                null == products
                    ? _value.products
                    : products // ignore: cast_nullable_to_non_nullable
                        as List<OrdersProductModel>,
            totalPrice:
                null == totalPrice
                    ? _value.totalPrice
                    : totalPrice // ignore: cast_nullable_to_non_nullable
                        as double,
            totalQuantity:
                null == totalQuantity
                    ? _value.totalQuantity
                    : totalQuantity // ignore: cast_nullable_to_non_nullable
                        as int,
            paymentMethod:
                null == paymentMethod
                    ? _value.paymentMethod
                    : paymentMethod // ignore: cast_nullable_to_non_nullable
                        as PaymentMethodEnum,
            deliveryInstructions:
                null == deliveryInstructions
                    ? _value.deliveryInstructions
                    : deliveryInstructions // ignore: cast_nullable_to_non_nullable
                        as DeliveryInstructionsEnum,
            orderStatus:
                null == orderStatus
                    ? _value.orderStatus
                    : orderStatus // ignore: cast_nullable_to_non_nullable
                        as OrderStatusEnum,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            arrivedAt:
                null == arrivedAt
                    ? _value.arrivedAt
                    : arrivedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrdersModelImplCopyWith<$Res>
    implements $OrdersModelCopyWith<$Res> {
  factory _$$OrdersModelImplCopyWith(
    _$OrdersModelImpl value,
    $Res Function(_$OrdersModelImpl) then,
  ) = __$$OrdersModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String orderId,
    String userId,
    String firstName,
    String lastName,
    String phoneNumber,
    String address,
    List<OrdersProductModel> products,
    double totalPrice,
    int totalQuantity,
    PaymentMethodEnum paymentMethod,
    DeliveryInstructionsEnum deliveryInstructions,
    OrderStatusEnum orderStatus,
    DateTime createdAt,
    DateTime arrivedAt,
  });
}

/// @nodoc
class __$$OrdersModelImplCopyWithImpl<$Res>
    extends _$OrdersModelCopyWithImpl<$Res, _$OrdersModelImpl>
    implements _$$OrdersModelImplCopyWith<$Res> {
  __$$OrdersModelImplCopyWithImpl(
    _$OrdersModelImpl _value,
    $Res Function(_$OrdersModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrdersModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? userId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phoneNumber = null,
    Object? address = null,
    Object? products = null,
    Object? totalPrice = null,
    Object? totalQuantity = null,
    Object? paymentMethod = null,
    Object? deliveryInstructions = null,
    Object? orderStatus = null,
    Object? createdAt = null,
    Object? arrivedAt = null,
  }) {
    return _then(
      _$OrdersModelImpl(
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String,
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        firstName:
            null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                    as String,
        lastName:
            null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
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
        products:
            null == products
                ? _value._products
                : products // ignore: cast_nullable_to_non_nullable
                    as List<OrdersProductModel>,
        totalPrice:
            null == totalPrice
                ? _value.totalPrice
                : totalPrice // ignore: cast_nullable_to_non_nullable
                    as double,
        totalQuantity:
            null == totalQuantity
                ? _value.totalQuantity
                : totalQuantity // ignore: cast_nullable_to_non_nullable
                    as int,
        paymentMethod:
            null == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                    as PaymentMethodEnum,
        deliveryInstructions:
            null == deliveryInstructions
                ? _value.deliveryInstructions
                : deliveryInstructions // ignore: cast_nullable_to_non_nullable
                    as DeliveryInstructionsEnum,
        orderStatus:
            null == orderStatus
                ? _value.orderStatus
                : orderStatus // ignore: cast_nullable_to_non_nullable
                    as OrderStatusEnum,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        arrivedAt:
            null == arrivedAt
                ? _value.arrivedAt
                : arrivedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OrdersModelImpl implements _OrdersModel {
  const _$OrdersModelImpl({
    required this.orderId,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.address,
    required final List<OrdersProductModel> products,
    required this.totalPrice,
    required this.totalQuantity,
    required this.paymentMethod,
    required this.deliveryInstructions,
    required this.orderStatus,
    required this.createdAt,
    required this.arrivedAt,
  }) : _products = products;

  factory _$OrdersModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrdersModelImplFromJson(json);

  @override
  final String orderId;
  @override
  final String userId;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String phoneNumber;
  @override
  final String address;
  final List<OrdersProductModel> _products;
  @override
  List<OrdersProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final double totalPrice;
  @override
  final int totalQuantity;
  @override
  final PaymentMethodEnum paymentMethod;
  @override
  final DeliveryInstructionsEnum deliveryInstructions;
  @override
  final OrderStatusEnum orderStatus;
  @override
  final DateTime createdAt;
  @override
  final DateTime arrivedAt;

  @override
  String toString() {
    return 'OrdersModel(orderId: $orderId, userId: $userId, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, address: $address, products: $products, totalPrice: $totalPrice, totalQuantity: $totalQuantity, paymentMethod: $paymentMethod, deliveryInstructions: $deliveryInstructions, orderStatus: $orderStatus, createdAt: $createdAt, arrivedAt: $arrivedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersModelImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.deliveryInstructions, deliveryInstructions) ||
                other.deliveryInstructions == deliveryInstructions) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.arrivedAt, arrivedAt) ||
                other.arrivedAt == arrivedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    orderId,
    userId,
    firstName,
    lastName,
    phoneNumber,
    address,
    const DeepCollectionEquality().hash(_products),
    totalPrice,
    totalQuantity,
    paymentMethod,
    deliveryInstructions,
    orderStatus,
    createdAt,
    arrivedAt,
  );

  /// Create a copy of OrdersModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrdersModelImplCopyWith<_$OrdersModelImpl> get copyWith =>
      __$$OrdersModelImplCopyWithImpl<_$OrdersModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrdersModelImplToJson(this);
  }
}

abstract class _OrdersModel implements OrdersModel {
  const factory _OrdersModel({
    required final String orderId,
    required final String userId,
    required final String firstName,
    required final String lastName,
    required final String phoneNumber,
    required final String address,
    required final List<OrdersProductModel> products,
    required final double totalPrice,
    required final int totalQuantity,
    required final PaymentMethodEnum paymentMethod,
    required final DeliveryInstructionsEnum deliveryInstructions,
    required final OrderStatusEnum orderStatus,
    required final DateTime createdAt,
    required final DateTime arrivedAt,
  }) = _$OrdersModelImpl;

  factory _OrdersModel.fromJson(Map<String, dynamic> json) =
      _$OrdersModelImpl.fromJson;

  @override
  String get orderId;
  @override
  String get userId;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get phoneNumber;
  @override
  String get address;
  @override
  List<OrdersProductModel> get products;
  @override
  double get totalPrice;
  @override
  int get totalQuantity;
  @override
  PaymentMethodEnum get paymentMethod;
  @override
  DeliveryInstructionsEnum get deliveryInstructions;
  @override
  OrderStatusEnum get orderStatus;
  @override
  DateTime get createdAt;
  @override
  DateTime get arrivedAt;

  /// Create a copy of OrdersModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrdersModelImplCopyWith<_$OrdersModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
