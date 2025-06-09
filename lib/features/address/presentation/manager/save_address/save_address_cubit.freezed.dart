// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_address_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SaveAddressState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddressEntity address) initial,
    required TResult Function(String loadingMessage) loading,
    required TResult Function(AddressEntity address) addSuccess,
    required TResult Function(AddressEntity address) editSuccess,
    required TResult Function(String errMessage) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AddressEntity address)? initial,
    TResult? Function(String loadingMessage)? loading,
    TResult? Function(AddressEntity address)? addSuccess,
    TResult? Function(AddressEntity address)? editSuccess,
    TResult? Function(String errMessage)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddressEntity address)? initial,
    TResult Function(String loadingMessage)? loading,
    TResult Function(AddressEntity address)? addSuccess,
    TResult Function(AddressEntity address)? editSuccess,
    TResult Function(String errMessage)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddSuccess value) addSuccess,
    required TResult Function(_EditSuccess value) editSuccess,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddSuccess value)? addSuccess,
    TResult? Function(_EditSuccess value)? editSuccess,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddSuccess value)? addSuccess,
    TResult Function(_EditSuccess value)? editSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveAddressStateCopyWith<$Res> {
  factory $SaveAddressStateCopyWith(
    SaveAddressState value,
    $Res Function(SaveAddressState) then,
  ) = _$SaveAddressStateCopyWithImpl<$Res, SaveAddressState>;
}

/// @nodoc
class _$SaveAddressStateCopyWithImpl<$Res, $Val extends SaveAddressState>
    implements $SaveAddressStateCopyWith<$Res> {
  _$SaveAddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaveAddressState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddressEntity address});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SaveAddressStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SaveAddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? address = null}) {
    return _then(
      _$InitialImpl(
        null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                as AddressEntity,
      ),
    );
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(this.address);

  @override
  final AddressEntity address;

  @override
  String toString() {
    return 'SaveAddressState.initial(address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address);

  /// Create a copy of SaveAddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddressEntity address) initial,
    required TResult Function(String loadingMessage) loading,
    required TResult Function(AddressEntity address) addSuccess,
    required TResult Function(AddressEntity address) editSuccess,
    required TResult Function(String errMessage) error,
  }) {
    return initial(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AddressEntity address)? initial,
    TResult? Function(String loadingMessage)? loading,
    TResult? Function(AddressEntity address)? addSuccess,
    TResult? Function(AddressEntity address)? editSuccess,
    TResult? Function(String errMessage)? error,
  }) {
    return initial?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddressEntity address)? initial,
    TResult Function(String loadingMessage)? loading,
    TResult Function(AddressEntity address)? addSuccess,
    TResult Function(AddressEntity address)? editSuccess,
    TResult Function(String errMessage)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddSuccess value) addSuccess,
    required TResult Function(_EditSuccess value) editSuccess,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddSuccess value)? addSuccess,
    TResult? Function(_EditSuccess value)? editSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddSuccess value)? addSuccess,
    TResult Function(_EditSuccess value)? editSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SaveAddressState {
  const factory _Initial(final AddressEntity address) = _$InitialImpl;

  AddressEntity get address;

  /// Create a copy of SaveAddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String loadingMessage});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SaveAddressStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SaveAddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? loadingMessage = null}) {
    return _then(
      _$LoadingImpl(
        null == loadingMessage
            ? _value.loadingMessage
            : loadingMessage // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(this.loadingMessage);

  @override
  final String loadingMessage;

  @override
  String toString() {
    return 'SaveAddressState.loading(loadingMessage: $loadingMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.loadingMessage, loadingMessage) ||
                other.loadingMessage == loadingMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingMessage);

  /// Create a copy of SaveAddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddressEntity address) initial,
    required TResult Function(String loadingMessage) loading,
    required TResult Function(AddressEntity address) addSuccess,
    required TResult Function(AddressEntity address) editSuccess,
    required TResult Function(String errMessage) error,
  }) {
    return loading(loadingMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AddressEntity address)? initial,
    TResult? Function(String loadingMessage)? loading,
    TResult? Function(AddressEntity address)? addSuccess,
    TResult? Function(AddressEntity address)? editSuccess,
    TResult? Function(String errMessage)? error,
  }) {
    return loading?.call(loadingMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddressEntity address)? initial,
    TResult Function(String loadingMessage)? loading,
    TResult Function(AddressEntity address)? addSuccess,
    TResult Function(AddressEntity address)? editSuccess,
    TResult Function(String errMessage)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(loadingMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddSuccess value) addSuccess,
    required TResult Function(_EditSuccess value) editSuccess,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddSuccess value)? addSuccess,
    TResult? Function(_EditSuccess value)? editSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddSuccess value)? addSuccess,
    TResult Function(_EditSuccess value)? editSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SaveAddressState {
  const factory _Loading(final String loadingMessage) = _$LoadingImpl;

  String get loadingMessage;

  /// Create a copy of SaveAddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddSuccessImplCopyWith<$Res> {
  factory _$$AddSuccessImplCopyWith(
    _$AddSuccessImpl value,
    $Res Function(_$AddSuccessImpl) then,
  ) = __$$AddSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddressEntity address});
}

/// @nodoc
class __$$AddSuccessImplCopyWithImpl<$Res>
    extends _$SaveAddressStateCopyWithImpl<$Res, _$AddSuccessImpl>
    implements _$$AddSuccessImplCopyWith<$Res> {
  __$$AddSuccessImplCopyWithImpl(
    _$AddSuccessImpl _value,
    $Res Function(_$AddSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SaveAddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? address = null}) {
    return _then(
      _$AddSuccessImpl(
        null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                as AddressEntity,
      ),
    );
  }
}

/// @nodoc

class _$AddSuccessImpl implements _AddSuccess {
  const _$AddSuccessImpl(this.address);

  @override
  final AddressEntity address;

  @override
  String toString() {
    return 'SaveAddressState.addSuccess(address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddSuccessImpl &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address);

  /// Create a copy of SaveAddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddSuccessImplCopyWith<_$AddSuccessImpl> get copyWith =>
      __$$AddSuccessImplCopyWithImpl<_$AddSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddressEntity address) initial,
    required TResult Function(String loadingMessage) loading,
    required TResult Function(AddressEntity address) addSuccess,
    required TResult Function(AddressEntity address) editSuccess,
    required TResult Function(String errMessage) error,
  }) {
    return addSuccess(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AddressEntity address)? initial,
    TResult? Function(String loadingMessage)? loading,
    TResult? Function(AddressEntity address)? addSuccess,
    TResult? Function(AddressEntity address)? editSuccess,
    TResult? Function(String errMessage)? error,
  }) {
    return addSuccess?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddressEntity address)? initial,
    TResult Function(String loadingMessage)? loading,
    TResult Function(AddressEntity address)? addSuccess,
    TResult Function(AddressEntity address)? editSuccess,
    TResult Function(String errMessage)? error,
    required TResult orElse(),
  }) {
    if (addSuccess != null) {
      return addSuccess(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddSuccess value) addSuccess,
    required TResult Function(_EditSuccess value) editSuccess,
    required TResult Function(_Error value) error,
  }) {
    return addSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddSuccess value)? addSuccess,
    TResult? Function(_EditSuccess value)? editSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return addSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddSuccess value)? addSuccess,
    TResult Function(_EditSuccess value)? editSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (addSuccess != null) {
      return addSuccess(this);
    }
    return orElse();
  }
}

abstract class _AddSuccess implements SaveAddressState {
  const factory _AddSuccess(final AddressEntity address) = _$AddSuccessImpl;

  AddressEntity get address;

  /// Create a copy of SaveAddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddSuccessImplCopyWith<_$AddSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditSuccessImplCopyWith<$Res> {
  factory _$$EditSuccessImplCopyWith(
    _$EditSuccessImpl value,
    $Res Function(_$EditSuccessImpl) then,
  ) = __$$EditSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddressEntity address});
}

/// @nodoc
class __$$EditSuccessImplCopyWithImpl<$Res>
    extends _$SaveAddressStateCopyWithImpl<$Res, _$EditSuccessImpl>
    implements _$$EditSuccessImplCopyWith<$Res> {
  __$$EditSuccessImplCopyWithImpl(
    _$EditSuccessImpl _value,
    $Res Function(_$EditSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SaveAddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? address = null}) {
    return _then(
      _$EditSuccessImpl(
        null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                as AddressEntity,
      ),
    );
  }
}

/// @nodoc

class _$EditSuccessImpl implements _EditSuccess {
  const _$EditSuccessImpl(this.address);

  @override
  final AddressEntity address;

  @override
  String toString() {
    return 'SaveAddressState.editSuccess(address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditSuccessImpl &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address);

  /// Create a copy of SaveAddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditSuccessImplCopyWith<_$EditSuccessImpl> get copyWith =>
      __$$EditSuccessImplCopyWithImpl<_$EditSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddressEntity address) initial,
    required TResult Function(String loadingMessage) loading,
    required TResult Function(AddressEntity address) addSuccess,
    required TResult Function(AddressEntity address) editSuccess,
    required TResult Function(String errMessage) error,
  }) {
    return editSuccess(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AddressEntity address)? initial,
    TResult? Function(String loadingMessage)? loading,
    TResult? Function(AddressEntity address)? addSuccess,
    TResult? Function(AddressEntity address)? editSuccess,
    TResult? Function(String errMessage)? error,
  }) {
    return editSuccess?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddressEntity address)? initial,
    TResult Function(String loadingMessage)? loading,
    TResult Function(AddressEntity address)? addSuccess,
    TResult Function(AddressEntity address)? editSuccess,
    TResult Function(String errMessage)? error,
    required TResult orElse(),
  }) {
    if (editSuccess != null) {
      return editSuccess(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddSuccess value) addSuccess,
    required TResult Function(_EditSuccess value) editSuccess,
    required TResult Function(_Error value) error,
  }) {
    return editSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddSuccess value)? addSuccess,
    TResult? Function(_EditSuccess value)? editSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return editSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddSuccess value)? addSuccess,
    TResult Function(_EditSuccess value)? editSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (editSuccess != null) {
      return editSuccess(this);
    }
    return orElse();
  }
}

abstract class _EditSuccess implements SaveAddressState {
  const factory _EditSuccess(final AddressEntity address) = _$EditSuccessImpl;

  AddressEntity get address;

  /// Create a copy of SaveAddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditSuccessImplCopyWith<_$EditSuccessImpl> get copyWith =>
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
    extends _$SaveAddressStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SaveAddressState
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
    return 'SaveAddressState.error(errMessage: $errMessage)';
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

  /// Create a copy of SaveAddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddressEntity address) initial,
    required TResult Function(String loadingMessage) loading,
    required TResult Function(AddressEntity address) addSuccess,
    required TResult Function(AddressEntity address) editSuccess,
    required TResult Function(String errMessage) error,
  }) {
    return error(errMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AddressEntity address)? initial,
    TResult? Function(String loadingMessage)? loading,
    TResult? Function(AddressEntity address)? addSuccess,
    TResult? Function(AddressEntity address)? editSuccess,
    TResult? Function(String errMessage)? error,
  }) {
    return error?.call(errMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddressEntity address)? initial,
    TResult Function(String loadingMessage)? loading,
    TResult Function(AddressEntity address)? addSuccess,
    TResult Function(AddressEntity address)? editSuccess,
    TResult Function(String errMessage)? error,
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
    required TResult Function(_AddSuccess value) addSuccess,
    required TResult Function(_EditSuccess value) editSuccess,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddSuccess value)? addSuccess,
    TResult? Function(_EditSuccess value)? editSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddSuccess value)? addSuccess,
    TResult Function(_EditSuccess value)? editSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SaveAddressState {
  const factory _Error(final String errMessage) = _$ErrorImpl;

  String get errMessage;

  /// Create a copy of SaveAddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
