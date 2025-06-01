// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ProductItemEntity> products) recentSearches,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(ProductsEntity productsEntity, bool isPaginating)
    resultSearches,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ProductItemEntity> products)? recentSearches,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(ProductsEntity productsEntity, bool isPaginating)?
    resultSearches,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ProductItemEntity> products)? recentSearches,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(ProductsEntity productsEntity, bool isPaginating)?
    resultSearches,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_RecentSearches value) recentSearches,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ResultSearches value) resultSearches,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_RecentSearches value)? recentSearches,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ResultSearches value)? resultSearches,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_RecentSearches value)? recentSearches,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ResultSearches value)? resultSearches,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
    SearchState value,
    $Res Function(SearchState) then,
  ) = _$SearchStateCopyWithImpl<$Res, SearchState>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchState
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
    extends _$SearchStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SearchState.initial()';
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
    required TResult Function(List<ProductItemEntity> products) recentSearches,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(ProductsEntity productsEntity, bool isPaginating)
    resultSearches,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ProductItemEntity> products)? recentSearches,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(ProductsEntity productsEntity, bool isPaginating)?
    resultSearches,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ProductItemEntity> products)? recentSearches,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(ProductsEntity productsEntity, bool isPaginating)?
    resultSearches,
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
    required TResult Function(_RecentSearches value) recentSearches,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ResultSearches value) resultSearches,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_RecentSearches value)? recentSearches,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ResultSearches value)? resultSearches,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_RecentSearches value)? recentSearches,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ResultSearches value)? resultSearches,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SearchState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$RecentSearchesImplCopyWith<$Res> {
  factory _$$RecentSearchesImplCopyWith(
    _$RecentSearchesImpl value,
    $Res Function(_$RecentSearchesImpl) then,
  ) = __$$RecentSearchesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductItemEntity> products});
}

/// @nodoc
class __$$RecentSearchesImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$RecentSearchesImpl>
    implements _$$RecentSearchesImplCopyWith<$Res> {
  __$$RecentSearchesImplCopyWithImpl(
    _$RecentSearchesImpl _value,
    $Res Function(_$RecentSearchesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? products = null}) {
    return _then(
      _$RecentSearchesImpl(
        null == products
            ? _value._products
            : products // ignore: cast_nullable_to_non_nullable
                as List<ProductItemEntity>,
      ),
    );
  }
}

/// @nodoc

class _$RecentSearchesImpl implements _RecentSearches {
  const _$RecentSearchesImpl(final List<ProductItemEntity> products)
    : _products = products;

  final List<ProductItemEntity> _products;
  @override
  List<ProductItemEntity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'SearchState.recentSearches(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentSearchesImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentSearchesImplCopyWith<_$RecentSearchesImpl> get copyWith =>
      __$$RecentSearchesImplCopyWithImpl<_$RecentSearchesImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ProductItemEntity> products) recentSearches,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(ProductsEntity productsEntity, bool isPaginating)
    resultSearches,
  }) {
    return recentSearches(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ProductItemEntity> products)? recentSearches,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(ProductsEntity productsEntity, bool isPaginating)?
    resultSearches,
  }) {
    return recentSearches?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ProductItemEntity> products)? recentSearches,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(ProductsEntity productsEntity, bool isPaginating)?
    resultSearches,
    required TResult orElse(),
  }) {
    if (recentSearches != null) {
      return recentSearches(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_RecentSearches value) recentSearches,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ResultSearches value) resultSearches,
  }) {
    return recentSearches(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_RecentSearches value)? recentSearches,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ResultSearches value)? resultSearches,
  }) {
    return recentSearches?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_RecentSearches value)? recentSearches,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ResultSearches value)? resultSearches,
    required TResult orElse(),
  }) {
    if (recentSearches != null) {
      return recentSearches(this);
    }
    return orElse();
  }
}

abstract class _RecentSearches implements SearchState {
  const factory _RecentSearches(final List<ProductItemEntity> products) =
      _$RecentSearchesImpl;

  List<ProductItemEntity> get products;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecentSearchesImplCopyWith<_$RecentSearchesImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$SearchStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SearchState.loading()';
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
    required TResult Function(List<ProductItemEntity> products) recentSearches,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(ProductsEntity productsEntity, bool isPaginating)
    resultSearches,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ProductItemEntity> products)? recentSearches,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(ProductsEntity productsEntity, bool isPaginating)?
    resultSearches,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ProductItemEntity> products)? recentSearches,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(ProductsEntity productsEntity, bool isPaginating)?
    resultSearches,
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
    required TResult Function(_RecentSearches value) recentSearches,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ResultSearches value) resultSearches,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_RecentSearches value)? recentSearches,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ResultSearches value)? resultSearches,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_RecentSearches value)? recentSearches,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ResultSearches value)? resultSearches,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SearchState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SearchState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SearchState
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
    required TResult Function(List<ProductItemEntity> products) recentSearches,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(ProductsEntity productsEntity, bool isPaginating)
    resultSearches,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ProductItemEntity> products)? recentSearches,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(ProductsEntity productsEntity, bool isPaginating)?
    resultSearches,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ProductItemEntity> products)? recentSearches,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(ProductsEntity productsEntity, bool isPaginating)?
    resultSearches,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_RecentSearches value) recentSearches,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ResultSearches value) resultSearches,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_RecentSearches value)? recentSearches,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ResultSearches value)? resultSearches,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_RecentSearches value)? recentSearches,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ResultSearches value)? resultSearches,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SearchState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResultSearchesImplCopyWith<$Res> {
  factory _$$ResultSearchesImplCopyWith(
    _$ResultSearchesImpl value,
    $Res Function(_$ResultSearchesImpl) then,
  ) = __$$ResultSearchesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductsEntity productsEntity, bool isPaginating});
}

/// @nodoc
class __$$ResultSearchesImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$ResultSearchesImpl>
    implements _$$ResultSearchesImplCopyWith<$Res> {
  __$$ResultSearchesImplCopyWithImpl(
    _$ResultSearchesImpl _value,
    $Res Function(_$ResultSearchesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? productsEntity = null, Object? isPaginating = null}) {
    return _then(
      _$ResultSearchesImpl(
        null == productsEntity
            ? _value.productsEntity
            : productsEntity // ignore: cast_nullable_to_non_nullable
                as ProductsEntity,
        isPaginating:
            null == isPaginating
                ? _value.isPaginating
                : isPaginating // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$ResultSearchesImpl implements _ResultSearches {
  const _$ResultSearchesImpl(this.productsEntity, {this.isPaginating = false});

  @override
  final ProductsEntity productsEntity;
  @override
  @JsonKey()
  final bool isPaginating;

  @override
  String toString() {
    return 'SearchState.resultSearches(productsEntity: $productsEntity, isPaginating: $isPaginating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultSearchesImpl &&
            (identical(other.productsEntity, productsEntity) ||
                other.productsEntity == productsEntity) &&
            (identical(other.isPaginating, isPaginating) ||
                other.isPaginating == isPaginating));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productsEntity, isPaginating);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultSearchesImplCopyWith<_$ResultSearchesImpl> get copyWith =>
      __$$ResultSearchesImplCopyWithImpl<_$ResultSearchesImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ProductItemEntity> products) recentSearches,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(ProductsEntity productsEntity, bool isPaginating)
    resultSearches,
  }) {
    return resultSearches(productsEntity, isPaginating);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ProductItemEntity> products)? recentSearches,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(ProductsEntity productsEntity, bool isPaginating)?
    resultSearches,
  }) {
    return resultSearches?.call(productsEntity, isPaginating);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ProductItemEntity> products)? recentSearches,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(ProductsEntity productsEntity, bool isPaginating)?
    resultSearches,
    required TResult orElse(),
  }) {
    if (resultSearches != null) {
      return resultSearches(productsEntity, isPaginating);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_RecentSearches value) recentSearches,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ResultSearches value) resultSearches,
  }) {
    return resultSearches(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_RecentSearches value)? recentSearches,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ResultSearches value)? resultSearches,
  }) {
    return resultSearches?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_RecentSearches value)? recentSearches,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ResultSearches value)? resultSearches,
    required TResult orElse(),
  }) {
    if (resultSearches != null) {
      return resultSearches(this);
    }
    return orElse();
  }
}

abstract class _ResultSearches implements SearchState {
  const factory _ResultSearches(
    final ProductsEntity productsEntity, {
    final bool isPaginating,
  }) = _$ResultSearchesImpl;

  ProductsEntity get productsEntity;
  bool get isPaginating;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultSearchesImplCopyWith<_$ResultSearchesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
