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
  OrdersCustomerInfoModel get customerInfoModel =>
      throw _privateConstructorUsedError;
  OrderSummaryModel get summaryModel => throw _privateConstructorUsedError;
  List<OrdersProductModel> get products => throw _privateConstructorUsedError;
  PaymentMethodEnum get paymentMethod => throw _privateConstructorUsedError;
  DeliveryInstructionsEnum get deliveryInstructions =>
      throw _privateConstructorUsedError;
  OrderStatusEnum get orderStatus => throw _privateConstructorUsedError;
  DateTime get placedAt => throw _privateConstructorUsedError;
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
    OrdersCustomerInfoModel customerInfoModel,
    OrderSummaryModel summaryModel,
    List<OrdersProductModel> products,
    PaymentMethodEnum paymentMethod,
    DeliveryInstructionsEnum deliveryInstructions,
    OrderStatusEnum orderStatus,
    DateTime placedAt,
    DateTime arrivedAt,
  });

  $OrdersCustomerInfoModelCopyWith<$Res> get customerInfoModel;
  $OrderSummaryModelCopyWith<$Res> get summaryModel;
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
    Object? customerInfoModel = null,
    Object? summaryModel = null,
    Object? products = null,
    Object? paymentMethod = null,
    Object? deliveryInstructions = null,
    Object? orderStatus = null,
    Object? placedAt = null,
    Object? arrivedAt = null,
  }) {
    return _then(
      _value.copyWith(
            orderId:
                null == orderId
                    ? _value.orderId
                    : orderId // ignore: cast_nullable_to_non_nullable
                        as String,
            customerInfoModel:
                null == customerInfoModel
                    ? _value.customerInfoModel
                    : customerInfoModel // ignore: cast_nullable_to_non_nullable
                        as OrdersCustomerInfoModel,
            summaryModel:
                null == summaryModel
                    ? _value.summaryModel
                    : summaryModel // ignore: cast_nullable_to_non_nullable
                        as OrderSummaryModel,
            products:
                null == products
                    ? _value.products
                    : products // ignore: cast_nullable_to_non_nullable
                        as List<OrdersProductModel>,
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
            placedAt:
                null == placedAt
                    ? _value.placedAt
                    : placedAt // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of OrdersModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrdersCustomerInfoModelCopyWith<$Res> get customerInfoModel {
    return $OrdersCustomerInfoModelCopyWith<$Res>(_value.customerInfoModel, (
      value,
    ) {
      return _then(_value.copyWith(customerInfoModel: value) as $Val);
    });
  }

  /// Create a copy of OrdersModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderSummaryModelCopyWith<$Res> get summaryModel {
    return $OrderSummaryModelCopyWith<$Res>(_value.summaryModel, (value) {
      return _then(_value.copyWith(summaryModel: value) as $Val);
    });
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
    OrdersCustomerInfoModel customerInfoModel,
    OrderSummaryModel summaryModel,
    List<OrdersProductModel> products,
    PaymentMethodEnum paymentMethod,
    DeliveryInstructionsEnum deliveryInstructions,
    OrderStatusEnum orderStatus,
    DateTime placedAt,
    DateTime arrivedAt,
  });

  @override
  $OrdersCustomerInfoModelCopyWith<$Res> get customerInfoModel;
  @override
  $OrderSummaryModelCopyWith<$Res> get summaryModel;
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
    Object? customerInfoModel = null,
    Object? summaryModel = null,
    Object? products = null,
    Object? paymentMethod = null,
    Object? deliveryInstructions = null,
    Object? orderStatus = null,
    Object? placedAt = null,
    Object? arrivedAt = null,
  }) {
    return _then(
      _$OrdersModelImpl(
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String,
        customerInfoModel:
            null == customerInfoModel
                ? _value.customerInfoModel
                : customerInfoModel // ignore: cast_nullable_to_non_nullable
                    as OrdersCustomerInfoModel,
        summaryModel:
            null == summaryModel
                ? _value.summaryModel
                : summaryModel // ignore: cast_nullable_to_non_nullable
                    as OrderSummaryModel,
        products:
            null == products
                ? _value._products
                : products // ignore: cast_nullable_to_non_nullable
                    as List<OrdersProductModel>,
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
        placedAt:
            null == placedAt
                ? _value.placedAt
                : placedAt // ignore: cast_nullable_to_non_nullable
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
    required this.customerInfoModel,
    required this.summaryModel,
    required final List<OrdersProductModel> products,
    required this.paymentMethod,
    required this.deliveryInstructions,
    required this.orderStatus,
    required this.placedAt,
    required this.arrivedAt,
  }) : _products = products;

  factory _$OrdersModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrdersModelImplFromJson(json);

  @override
  final String orderId;
  @override
  final OrdersCustomerInfoModel customerInfoModel;
  @override
  final OrderSummaryModel summaryModel;
  final List<OrdersProductModel> _products;
  @override
  List<OrdersProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final PaymentMethodEnum paymentMethod;
  @override
  final DeliveryInstructionsEnum deliveryInstructions;
  @override
  final OrderStatusEnum orderStatus;
  @override
  final DateTime placedAt;
  @override
  final DateTime arrivedAt;

  @override
  String toString() {
    return 'OrdersModel(orderId: $orderId, customerInfoModel: $customerInfoModel, summaryModel: $summaryModel, products: $products, paymentMethod: $paymentMethod, deliveryInstructions: $deliveryInstructions, orderStatus: $orderStatus, placedAt: $placedAt, arrivedAt: $arrivedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersModelImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.customerInfoModel, customerInfoModel) ||
                other.customerInfoModel == customerInfoModel) &&
            (identical(other.summaryModel, summaryModel) ||
                other.summaryModel == summaryModel) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.deliveryInstructions, deliveryInstructions) ||
                other.deliveryInstructions == deliveryInstructions) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.placedAt, placedAt) ||
                other.placedAt == placedAt) &&
            (identical(other.arrivedAt, arrivedAt) ||
                other.arrivedAt == arrivedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    orderId,
    customerInfoModel,
    summaryModel,
    const DeepCollectionEquality().hash(_products),
    paymentMethod,
    deliveryInstructions,
    orderStatus,
    placedAt,
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
    required final OrdersCustomerInfoModel customerInfoModel,
    required final OrderSummaryModel summaryModel,
    required final List<OrdersProductModel> products,
    required final PaymentMethodEnum paymentMethod,
    required final DeliveryInstructionsEnum deliveryInstructions,
    required final OrderStatusEnum orderStatus,
    required final DateTime placedAt,
    required final DateTime arrivedAt,
  }) = _$OrdersModelImpl;

  factory _OrdersModel.fromJson(Map<String, dynamic> json) =
      _$OrdersModelImpl.fromJson;

  @override
  String get orderId;
  @override
  OrdersCustomerInfoModel get customerInfoModel;
  @override
  OrderSummaryModel get summaryModel;
  @override
  List<OrdersProductModel> get products;
  @override
  PaymentMethodEnum get paymentMethod;
  @override
  DeliveryInstructionsEnum get deliveryInstructions;
  @override
  OrderStatusEnum get orderStatus;
  @override
  DateTime get placedAt;
  @override
  DateTime get arrivedAt;

  /// Create a copy of OrdersModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrdersModelImplCopyWith<_$OrdersModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
