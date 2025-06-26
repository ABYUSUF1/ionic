// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ShopState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products) loadingMore,
    required TResult Function(String errMessage) error,
    required TResult Function(List<Product> products, bool hasReachedMax)
    success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products)? loadingMore,
    TResult? Function(String errMessage)? error,
    TResult? Function(List<Product> products, bool hasReachedMax)? success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products)? loadingMore,
    TResult Function(String errMessage)? error,
    TResult Function(List<Product> products, bool hasReachedMax)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopStateCopyWith<$Res> {
  factory $ShopStateCopyWith(ShopState value, $Res Function(ShopState) then) =
      _$ShopStateCopyWithImpl<$Res, ShopState>;
}

/// @nodoc
class _$ShopStateCopyWithImpl<$Res, $Val extends ShopState>
    implements $ShopStateCopyWith<$Res> {
  _$ShopStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShopState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ShopStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShopState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ShopState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products) loadingMore,
    required TResult Function(String errMessage) error,
    required TResult Function(List<Product> products, bool hasReachedMax)
    success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products)? loadingMore,
    TResult? Function(String errMessage)? error,
    TResult? Function(List<Product> products, bool hasReachedMax)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products)? loadingMore,
    TResult Function(String errMessage)? error,
    TResult Function(List<Product> products, bool hasReachedMax)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ShopState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ShopStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShopState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ShopState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products) loadingMore,
    required TResult Function(String errMessage) error,
    required TResult Function(List<Product> products, bool hasReachedMax)
    success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products)? loadingMore,
    TResult? Function(String errMessage)? error,
    TResult? Function(List<Product> products, bool hasReachedMax)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products)? loadingMore,
    TResult Function(String errMessage)? error,
    TResult Function(List<Product> products, bool hasReachedMax)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ShopState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadingMoreImplCopyWith<$Res> {
  factory _$$LoadingMoreImplCopyWith(
    _$LoadingMoreImpl value,
    $Res Function(_$LoadingMoreImpl) then,
  ) = __$$LoadingMoreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class __$$LoadingMoreImplCopyWithImpl<$Res>
    extends _$ShopStateCopyWithImpl<$Res, _$LoadingMoreImpl>
    implements _$$LoadingMoreImplCopyWith<$Res> {
  __$$LoadingMoreImplCopyWithImpl(
    _$LoadingMoreImpl _value,
    $Res Function(_$LoadingMoreImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShopState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? products = null}) {
    return _then(
      _$LoadingMoreImpl(
        null == products
            ? _value._products
            : products // ignore: cast_nullable_to_non_nullable
                as List<Product>,
      ),
    );
  }
}

/// @nodoc

class _$LoadingMoreImpl implements _LoadingMore {
  const _$LoadingMoreImpl(final List<Product> products) : _products = products;

  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ShopState.loadingMore(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingMoreImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  /// Create a copy of ShopState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingMoreImplCopyWith<_$LoadingMoreImpl> get copyWith =>
      __$$LoadingMoreImplCopyWithImpl<_$LoadingMoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products) loadingMore,
    required TResult Function(String errMessage) error,
    required TResult Function(List<Product> products, bool hasReachedMax)
    success,
  }) {
    return loadingMore(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products)? loadingMore,
    TResult? Function(String errMessage)? error,
    TResult? Function(List<Product> products, bool hasReachedMax)? success,
  }) {
    return loadingMore?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products)? loadingMore,
    TResult Function(String errMessage)? error,
    TResult Function(List<Product> products, bool hasReachedMax)? success,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return loadingMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return loadingMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(this);
    }
    return orElse();
  }
}

abstract class _LoadingMore implements ShopState {
  const factory _LoadingMore(final List<Product> products) = _$LoadingMoreImpl;

  List<Product> get products;

  /// Create a copy of ShopState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingMoreImplCopyWith<_$LoadingMoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errMessage});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ShopStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShopState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? errMessage = null}) {
    return _then(
      _$ErrorImpl(
        null == errMessage
            ? _value.errMessage
            : errMessage // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.errMessage);

  @override
  final String errMessage;

  @override
  String toString() {
    return 'ShopState.error(errMessage: $errMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.errMessage, errMessage) ||
                other.errMessage == errMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errMessage);

  /// Create a copy of ShopState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products) loadingMore,
    required TResult Function(String errMessage) error,
    required TResult Function(List<Product> products, bool hasReachedMax)
    success,
  }) {
    return error(errMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products)? loadingMore,
    TResult? Function(String errMessage)? error,
    TResult? Function(List<Product> products, bool hasReachedMax)? success,
  }) {
    return error?.call(errMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products)? loadingMore,
    TResult Function(String errMessage)? error,
    TResult Function(List<Product> products, bool hasReachedMax)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ShopState {
  const factory _Error(final String errMessage) = _$ErrorImpl;

  String get errMessage;

  /// Create a copy of ShopState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Product> products, bool hasReachedMax});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ShopStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShopState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? products = null, Object? hasReachedMax = null}) {
    return _then(
      _$SuccessImpl(
        null == products
            ? _value._products
            : products // ignore: cast_nullable_to_non_nullable
                as List<Product>,
        hasReachedMax:
            null == hasReachedMax
                ? _value.hasReachedMax
                : hasReachedMax // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(
    final List<Product> products, {
    this.hasReachedMax = false,
  }) : _products = products;

  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @JsonKey()
  final bool hasReachedMax;

  @override
  String toString() {
    return 'ShopState.success(products: $products, hasReachedMax: $hasReachedMax)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_products),
    hasReachedMax,
  );

  /// Create a copy of ShopState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products) loadingMore,
    required TResult Function(String errMessage) error,
    required TResult Function(List<Product> products, bool hasReachedMax)
    success,
  }) {
    return success(products, hasReachedMax);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products)? loadingMore,
    TResult? Function(String errMessage)? error,
    TResult? Function(List<Product> products, bool hasReachedMax)? success,
  }) {
    return success?.call(products, hasReachedMax);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products)? loadingMore,
    TResult Function(String errMessage)? error,
    TResult Function(List<Product> products, bool hasReachedMax)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(products, hasReachedMax);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadingMore value)? loadingMore,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ShopState {
  const factory _Success(
    final List<Product> products, {
    final bool hasReachedMax,
  }) = _$SuccessImpl;

  List<Product> get products;
  bool get hasReachedMax;

  /// Create a copy of ShopState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
