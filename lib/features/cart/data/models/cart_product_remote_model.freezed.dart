// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_product_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CartProductRemoteModel _$CartProductRemoteModelFromJson(
  Map<String, dynamic> json,
) {
  return _CartProductRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$CartProductRemoteModel {
  ProductItemModel get productItem => throw _privateConstructorUsedError;
  String get returnPolicy => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this CartProductRemoteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartProductRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartProductRemoteModelCopyWith<CartProductRemoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartProductRemoteModelCopyWith<$Res> {
  factory $CartProductRemoteModelCopyWith(
    CartProductRemoteModel value,
    $Res Function(CartProductRemoteModel) then,
  ) = _$CartProductRemoteModelCopyWithImpl<$Res, CartProductRemoteModel>;
  @useResult
  $Res call({ProductItemModel productItem, String returnPolicy, int quantity});

  $ProductItemModelCopyWith<$Res> get productItem;
}

/// @nodoc
class _$CartProductRemoteModelCopyWithImpl<
  $Res,
  $Val extends CartProductRemoteModel
>
    implements $CartProductRemoteModelCopyWith<$Res> {
  _$CartProductRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartProductRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productItem = null,
    Object? returnPolicy = null,
    Object? quantity = null,
  }) {
    return _then(
      _value.copyWith(
            productItem:
                null == productItem
                    ? _value.productItem
                    : productItem // ignore: cast_nullable_to_non_nullable
                        as ProductItemModel,
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

  /// Create a copy of CartProductRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductItemModelCopyWith<$Res> get productItem {
    return $ProductItemModelCopyWith<$Res>(_value.productItem, (value) {
      return _then(_value.copyWith(productItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartProductRemoteModelImplCopyWith<$Res>
    implements $CartProductRemoteModelCopyWith<$Res> {
  factory _$$CartProductRemoteModelImplCopyWith(
    _$CartProductRemoteModelImpl value,
    $Res Function(_$CartProductRemoteModelImpl) then,
  ) = __$$CartProductRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductItemModel productItem, String returnPolicy, int quantity});

  @override
  $ProductItemModelCopyWith<$Res> get productItem;
}

/// @nodoc
class __$$CartProductRemoteModelImplCopyWithImpl<$Res>
    extends
        _$CartProductRemoteModelCopyWithImpl<$Res, _$CartProductRemoteModelImpl>
    implements _$$CartProductRemoteModelImplCopyWith<$Res> {
  __$$CartProductRemoteModelImplCopyWithImpl(
    _$CartProductRemoteModelImpl _value,
    $Res Function(_$CartProductRemoteModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartProductRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productItem = null,
    Object? returnPolicy = null,
    Object? quantity = null,
  }) {
    return _then(
      _$CartProductRemoteModelImpl(
        productItem:
            null == productItem
                ? _value.productItem
                : productItem // ignore: cast_nullable_to_non_nullable
                    as ProductItemModel,
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

@JsonSerializable(explicitToJson: true)
class _$CartProductRemoteModelImpl implements _CartProductRemoteModel {
  const _$CartProductRemoteModelImpl({
    required this.productItem,
    required this.returnPolicy,
    required this.quantity,
  });

  factory _$CartProductRemoteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartProductRemoteModelImplFromJson(json);

  @override
  final ProductItemModel productItem;
  @override
  final String returnPolicy;
  @override
  final int quantity;

  @override
  String toString() {
    return 'CartProductRemoteModel(productItem: $productItem, returnPolicy: $returnPolicy, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartProductRemoteModelImpl &&
            (identical(other.productItem, productItem) ||
                other.productItem == productItem) &&
            (identical(other.returnPolicy, returnPolicy) ||
                other.returnPolicy == returnPolicy) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productItem, returnPolicy, quantity);

  /// Create a copy of CartProductRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartProductRemoteModelImplCopyWith<_$CartProductRemoteModelImpl>
  get copyWith =>
      __$$CartProductRemoteModelImplCopyWithImpl<_$CartProductRemoteModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CartProductRemoteModelImplToJson(this);
  }
}

abstract class _CartProductRemoteModel implements CartProductRemoteModel {
  const factory _CartProductRemoteModel({
    required final ProductItemModel productItem,
    required final String returnPolicy,
    required final int quantity,
  }) = _$CartProductRemoteModelImpl;

  factory _CartProductRemoteModel.fromJson(Map<String, dynamic> json) =
      _$CartProductRemoteModelImpl.fromJson;

  @override
  ProductItemModel get productItem;
  @override
  String get returnPolicy;
  @override
  int get quantity;

  /// Create a copy of CartProductRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartProductRemoteModelImplCopyWith<_$CartProductRemoteModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
