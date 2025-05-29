// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductItemModel _$ProductItemModelFromJson(Map<String, dynamic> json) {
  return _ProductItemModel.fromJson(json);
}

/// @nodoc
mixin _$ProductItemModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get stock => throw _privateConstructorUsedError;
  int get reviewsCount => throw _privateConstructorUsedError;

  /// Serializes this ProductItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductItemModelCopyWith<ProductItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductItemModelCopyWith<$Res> {
  factory $ProductItemModelCopyWith(
    ProductItemModel value,
    $Res Function(ProductItemModel) then,
  ) = _$ProductItemModelCopyWithImpl<$Res, ProductItemModel>;
  @useResult
  $Res call({
    String id,
    String title,
    String imageUrl,
    double price,
    double rating,
    int stock,
    int reviewsCount,
  });
}

/// @nodoc
class _$ProductItemModelCopyWithImpl<$Res, $Val extends ProductItemModel>
    implements $ProductItemModelCopyWith<$Res> {
  _$ProductItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? imageUrl = null,
    Object? price = null,
    Object? rating = null,
    Object? stock = null,
    Object? reviewsCount = null,
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
            price:
                null == price
                    ? _value.price
                    : price // ignore: cast_nullable_to_non_nullable
                        as double,
            rating:
                null == rating
                    ? _value.rating
                    : rating // ignore: cast_nullable_to_non_nullable
                        as double,
            stock:
                null == stock
                    ? _value.stock
                    : stock // ignore: cast_nullable_to_non_nullable
                        as int,
            reviewsCount:
                null == reviewsCount
                    ? _value.reviewsCount
                    : reviewsCount // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductItemModelImplCopyWith<$Res>
    implements $ProductItemModelCopyWith<$Res> {
  factory _$$ProductItemModelImplCopyWith(
    _$ProductItemModelImpl value,
    $Res Function(_$ProductItemModelImpl) then,
  ) = __$$ProductItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String imageUrl,
    double price,
    double rating,
    int stock,
    int reviewsCount,
  });
}

/// @nodoc
class __$$ProductItemModelImplCopyWithImpl<$Res>
    extends _$ProductItemModelCopyWithImpl<$Res, _$ProductItemModelImpl>
    implements _$$ProductItemModelImplCopyWith<$Res> {
  __$$ProductItemModelImplCopyWithImpl(
    _$ProductItemModelImpl _value,
    $Res Function(_$ProductItemModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? imageUrl = null,
    Object? price = null,
    Object? rating = null,
    Object? stock = null,
    Object? reviewsCount = null,
  }) {
    return _then(
      _$ProductItemModelImpl(
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
        price:
            null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                    as double,
        rating:
            null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                    as double,
        stock:
            null == stock
                ? _value.stock
                : stock // ignore: cast_nullable_to_non_nullable
                    as int,
        reviewsCount:
            null == reviewsCount
                ? _value.reviewsCount
                : reviewsCount // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductItemModelImpl implements _ProductItemModel {
  _$ProductItemModelImpl({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.stock,
    required this.reviewsCount,
  });

  factory _$ProductItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductItemModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String imageUrl;
  @override
  final double price;
  @override
  final double rating;
  @override
  final int stock;
  @override
  final int reviewsCount;

  @override
  String toString() {
    return 'ProductItemModel(id: $id, title: $title, imageUrl: $imageUrl, price: $price, rating: $rating, stock: $stock, reviewsCount: $reviewsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.reviewsCount, reviewsCount) ||
                other.reviewsCount == reviewsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    imageUrl,
    price,
    rating,
    stock,
    reviewsCount,
  );

  /// Create a copy of ProductItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductItemModelImplCopyWith<_$ProductItemModelImpl> get copyWith =>
      __$$ProductItemModelImplCopyWithImpl<_$ProductItemModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductItemModelImplToJson(this);
  }
}

abstract class _ProductItemModel implements ProductItemModel {
  factory _ProductItemModel({
    required final String id,
    required final String title,
    required final String imageUrl,
    required final double price,
    required final double rating,
    required final int stock,
    required final int reviewsCount,
  }) = _$ProductItemModelImpl;

  factory _ProductItemModel.fromJson(Map<String, dynamic> json) =
      _$ProductItemModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get imageUrl;
  @override
  double get price;
  @override
  double get rating;
  @override
  int get stock;
  @override
  int get reviewsCount;

  /// Create a copy of ProductItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductItemModelImplCopyWith<_$ProductItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
