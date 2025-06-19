// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CartRemoteModel _$CartRemoteModelFromJson(Map<String, dynamic> json) {
  return _CartRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$CartRemoteModel {
  List<CartProductRemoteModel> get cartProducts =>
      throw _privateConstructorUsedError;

  /// Serializes this CartRemoteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartRemoteModelCopyWith<CartRemoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartRemoteModelCopyWith<$Res> {
  factory $CartRemoteModelCopyWith(
    CartRemoteModel value,
    $Res Function(CartRemoteModel) then,
  ) = _$CartRemoteModelCopyWithImpl<$Res, CartRemoteModel>;
  @useResult
  $Res call({List<CartProductRemoteModel> cartProducts});
}

/// @nodoc
class _$CartRemoteModelCopyWithImpl<$Res, $Val extends CartRemoteModel>
    implements $CartRemoteModelCopyWith<$Res> {
  _$CartRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cartProducts = null}) {
    return _then(
      _value.copyWith(
            cartProducts:
                null == cartProducts
                    ? _value.cartProducts
                    : cartProducts // ignore: cast_nullable_to_non_nullable
                        as List<CartProductRemoteModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartRemoteModelImplCopyWith<$Res>
    implements $CartRemoteModelCopyWith<$Res> {
  factory _$$CartRemoteModelImplCopyWith(
    _$CartRemoteModelImpl value,
    $Res Function(_$CartRemoteModelImpl) then,
  ) = __$$CartRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CartProductRemoteModel> cartProducts});
}

/// @nodoc
class __$$CartRemoteModelImplCopyWithImpl<$Res>
    extends _$CartRemoteModelCopyWithImpl<$Res, _$CartRemoteModelImpl>
    implements _$$CartRemoteModelImplCopyWith<$Res> {
  __$$CartRemoteModelImplCopyWithImpl(
    _$CartRemoteModelImpl _value,
    $Res Function(_$CartRemoteModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cartProducts = null}) {
    return _then(
      _$CartRemoteModelImpl(
        cartProducts:
            null == cartProducts
                ? _value._cartProducts
                : cartProducts // ignore: cast_nullable_to_non_nullable
                    as List<CartProductRemoteModel>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CartRemoteModelImpl implements _CartRemoteModel {
  const _$CartRemoteModelImpl({
    required final List<CartProductRemoteModel> cartProducts,
  }) : _cartProducts = cartProducts;

  factory _$CartRemoteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartRemoteModelImplFromJson(json);

  final List<CartProductRemoteModel> _cartProducts;
  @override
  List<CartProductRemoteModel> get cartProducts {
    if (_cartProducts is EqualUnmodifiableListView) return _cartProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartProducts);
  }

  @override
  String toString() {
    return 'CartRemoteModel(cartProducts: $cartProducts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartRemoteModelImpl &&
            const DeepCollectionEquality().equals(
              other._cartProducts,
              _cartProducts,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_cartProducts),
  );

  /// Create a copy of CartRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartRemoteModelImplCopyWith<_$CartRemoteModelImpl> get copyWith =>
      __$$CartRemoteModelImplCopyWithImpl<_$CartRemoteModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CartRemoteModelImplToJson(this);
  }
}

abstract class _CartRemoteModel implements CartRemoteModel {
  const factory _CartRemoteModel({
    required final List<CartProductRemoteModel> cartProducts,
  }) = _$CartRemoteModelImpl;

  factory _CartRemoteModel.fromJson(Map<String, dynamic> json) =
      _$CartRemoteModelImpl.fromJson;

  @override
  List<CartProductRemoteModel> get cartProducts;

  /// Create a copy of CartRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartRemoteModelImplCopyWith<_$CartRemoteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
