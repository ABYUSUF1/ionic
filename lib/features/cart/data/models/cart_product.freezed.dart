// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CartProduct _$CartProductFromJson(Map<String, dynamic> json) {
  return _CartProduct.fromJson(json);
}

/// @nodoc
mixin _$CartProduct {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  String get returnPolicy => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this CartProduct to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartProductCopyWith<CartProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartProductCopyWith<$Res> {
  factory $CartProductCopyWith(
    CartProduct value,
    $Res Function(CartProduct) then,
  ) = _$CartProductCopyWithImpl<$Res, CartProduct>;
  @useResult
  $Res call({
    String id,
    String title,
    String imageUrl,
    String brand,
    double price,
    double discount,
    String returnPolicy,
    int quantity,
  });
}

/// @nodoc
class _$CartProductCopyWithImpl<$Res, $Val extends CartProduct>
    implements $CartProductCopyWith<$Res> {
  _$CartProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? imageUrl = null,
    Object? brand = null,
    Object? price = null,
    Object? discount = null,
    Object? returnPolicy = null,
    Object? quantity = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
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
            discount:
                null == discount
                    ? _value.discount
                    : discount // ignore: cast_nullable_to_non_nullable
                        as double,
            returnPolicy:
                null == returnPolicy
                    ? _value.returnPolicy
                    : returnPolicy // ignore: cast_nullable_to_non_nullable
                        as String,
            quantity:
                null == quantity
                    ? _value.quantity
                    : quantity // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartProductImplCopyWith<$Res>
    implements $CartProductCopyWith<$Res> {
  factory _$$CartProductImplCopyWith(
    _$CartProductImpl value,
    $Res Function(_$CartProductImpl) then,
  ) = __$$CartProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String imageUrl,
    String brand,
    double price,
    double discount,
    String returnPolicy,
    int quantity,
  });
}

/// @nodoc
class __$$CartProductImplCopyWithImpl<$Res>
    extends _$CartProductCopyWithImpl<$Res, _$CartProductImpl>
    implements _$$CartProductImplCopyWith<$Res> {
  __$$CartProductImplCopyWithImpl(
    _$CartProductImpl _value,
    $Res Function(_$CartProductImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? imageUrl = null,
    Object? brand = null,
    Object? price = null,
    Object? discount = null,
    Object? returnPolicy = null,
    Object? quantity = null,
  }) {
    return _then(
      _$CartProductImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
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
        discount:
            null == discount
                ? _value.discount
                : discount // ignore: cast_nullable_to_non_nullable
                    as double,
        returnPolicy:
            null == returnPolicy
                ? _value.returnPolicy
                : returnPolicy // ignore: cast_nullable_to_non_nullable
                    as String,
        quantity:
            null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CartProductImpl implements _CartProduct {
  const _$CartProductImpl({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.brand,
    required this.price,
    required this.discount,
    required this.returnPolicy,
    required this.quantity,
  });

  factory _$CartProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartProductImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String imageUrl;
  @override
  final String brand;
  @override
  final double price;
  @override
  final double discount;
  @override
  final String returnPolicy;
  @override
  final int quantity;

  @override
  String toString() {
    return 'CartProduct(id: $id, title: $title, imageUrl: $imageUrl, brand: $brand, price: $price, discount: $discount, returnPolicy: $returnPolicy, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.returnPolicy, returnPolicy) ||
                other.returnPolicy == returnPolicy) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    imageUrl,
    brand,
    price,
    discount,
    returnPolicy,
    quantity,
  );

  /// Create a copy of CartProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartProductImplCopyWith<_$CartProductImpl> get copyWith =>
      __$$CartProductImplCopyWithImpl<_$CartProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartProductImplToJson(this);
  }
}

abstract class _CartProduct implements CartProduct {
  const factory _CartProduct({
    required final String id,
    required final String title,
    required final String imageUrl,
    required final String brand,
    required final double price,
    required final double discount,
    required final String returnPolicy,
    required final int quantity,
  }) = _$CartProductImpl;

  factory _CartProduct.fromJson(Map<String, dynamic> json) =
      _$CartProductImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get imageUrl;
  @override
  String get brand;
  @override
  double get price;
  @override
  double get discount;
  @override
  String get returnPolicy;
  @override
  int get quantity;

  /// Create a copy of CartProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartProductImplCopyWith<_$CartProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
