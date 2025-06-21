// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrdersProductModel _$OrdersProductModelFromJson(Map<String, dynamic> json) {
  return _OrdersProductModel.fromJson(json);
}

/// @nodoc
mixin _$OrdersProductModel {
  String get productId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;

  /// Serializes this OrdersProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrdersProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrdersProductModelCopyWith<OrdersProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersProductModelCopyWith<$Res> {
  factory $OrdersProductModelCopyWith(
    OrdersProductModel value,
    $Res Function(OrdersProductModel) then,
  ) = _$OrdersProductModelCopyWithImpl<$Res, OrdersProductModel>;
  @useResult
  $Res call({
    String productId,
    String name,
    String imageUrl,
    String brand,
    double price,
    int quantity,
    double totalPrice,
  });
}

/// @nodoc
class _$OrdersProductModelCopyWithImpl<$Res, $Val extends OrdersProductModel>
    implements $OrdersProductModelCopyWith<$Res> {
  _$OrdersProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrdersProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? brand = null,
    Object? price = null,
    Object? quantity = null,
    Object? totalPrice = null,
  }) {
    return _then(
      _value.copyWith(
            productId:
                null == productId
                    ? _value.productId
                    : productId // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            imageUrl:
                null == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            brand:
                null == brand
                    ? _value.brand
                    : brand // ignore: cast_nullable_to_non_nullable
                        as String,
            price:
                null == price
                    ? _value.price
                    : price // ignore: cast_nullable_to_non_nullable
                        as double,
            quantity:
                null == quantity
                    ? _value.quantity
                    : quantity // ignore: cast_nullable_to_non_nullable
                        as int,
            totalPrice:
                null == totalPrice
                    ? _value.totalPrice
                    : totalPrice // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrdersProductModelImplCopyWith<$Res>
    implements $OrdersProductModelCopyWith<$Res> {
  factory _$$OrdersProductModelImplCopyWith(
    _$OrdersProductModelImpl value,
    $Res Function(_$OrdersProductModelImpl) then,
  ) = __$$OrdersProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String productId,
    String name,
    String imageUrl,
    String brand,
    double price,
    int quantity,
    double totalPrice,
  });
}

/// @nodoc
class __$$OrdersProductModelImplCopyWithImpl<$Res>
    extends _$OrdersProductModelCopyWithImpl<$Res, _$OrdersProductModelImpl>
    implements _$$OrdersProductModelImplCopyWith<$Res> {
  __$$OrdersProductModelImplCopyWithImpl(
    _$OrdersProductModelImpl _value,
    $Res Function(_$OrdersProductModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrdersProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? brand = null,
    Object? price = null,
    Object? quantity = null,
    Object? totalPrice = null,
  }) {
    return _then(
      _$OrdersProductModelImpl(
        productId:
            null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        imageUrl:
            null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        brand:
            null == brand
                ? _value.brand
                : brand // ignore: cast_nullable_to_non_nullable
                    as String,
        price:
            null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                    as double,
        quantity:
            null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                    as int,
        totalPrice:
            null == totalPrice
                ? _value.totalPrice
                : totalPrice // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrdersProductModelImpl implements _OrdersProductModel {
  const _$OrdersProductModelImpl({
    required this.productId,
    required this.name,
    required this.imageUrl,
    required this.brand,
    required this.price,
    required this.quantity,
    required this.totalPrice,
  });

  factory _$OrdersProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrdersProductModelImplFromJson(json);

  @override
  final String productId;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final String brand;
  @override
  final double price;
  @override
  final int quantity;
  @override
  final double totalPrice;

  @override
  String toString() {
    return 'OrdersProductModel(productId: $productId, name: $name, imageUrl: $imageUrl, brand: $brand, price: $price, quantity: $quantity, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersProductModelImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    productId,
    name,
    imageUrl,
    brand,
    price,
    quantity,
    totalPrice,
  );

  /// Create a copy of OrdersProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrdersProductModelImplCopyWith<_$OrdersProductModelImpl> get copyWith =>
      __$$OrdersProductModelImplCopyWithImpl<_$OrdersProductModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrdersProductModelImplToJson(this);
  }
}

abstract class _OrdersProductModel implements OrdersProductModel {
  const factory _OrdersProductModel({
    required final String productId,
    required final String name,
    required final String imageUrl,
    required final String brand,
    required final double price,
    required final int quantity,
    required final double totalPrice,
  }) = _$OrdersProductModelImpl;

  factory _OrdersProductModel.fromJson(Map<String, dynamic> json) =
      _$OrdersProductModelImpl.fromJson;

  @override
  String get productId;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  String get brand;
  @override
  double get price;
  @override
  int get quantity;
  @override
  double get totalPrice;

  /// Create a copy of OrdersProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrdersProductModelImplCopyWith<_$OrdersProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
