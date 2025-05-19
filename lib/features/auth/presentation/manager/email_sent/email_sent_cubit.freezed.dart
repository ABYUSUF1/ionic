// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_sent_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$EmailSentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) inProgress,
    required TResult Function(String message) error,
    required TResult Function(int secondsRemaining) coolDown,
    required TResult Function() emailVerified,
    required TResult Function() emailNotVerified,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? inProgress,
    TResult? Function(String message)? error,
    TResult? Function(int secondsRemaining)? coolDown,
    TResult? Function()? emailVerified,
    TResult? Function()? emailNotVerified,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? inProgress,
    TResult Function(String message)? error,
    TResult Function(int secondsRemaining)? coolDown,
    TResult Function()? emailVerified,
    TResult Function()? emailNotVerified,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Error value) error,
    required TResult Function(_CoolDown value) coolDown,
    required TResult Function(_EmailVerified value) emailVerified,
    required TResult Function(_EmailNotVerified value) emailNotVerified,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoolDown value)? coolDown,
    TResult? Function(_EmailVerified value)? emailVerified,
    TResult? Function(_EmailNotVerified value)? emailNotVerified,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Error value)? error,
    TResult Function(_CoolDown value)? coolDown,
    TResult Function(_EmailVerified value)? emailVerified,
    TResult Function(_EmailNotVerified value)? emailNotVerified,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailSentStateCopyWith<$Res> {
  factory $EmailSentStateCopyWith(
    EmailSentState value,
    $Res Function(EmailSentState) then,
  ) = _$EmailSentStateCopyWithImpl<$Res, EmailSentState>;
}

/// @nodoc
class _$EmailSentStateCopyWithImpl<$Res, $Val extends EmailSentState>
    implements $EmailSentStateCopyWith<$Res> {
  _$EmailSentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmailSentState
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
    extends _$EmailSentStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmailSentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'EmailSentState.initial()';
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
    required TResult Function(String message) inProgress,
    required TResult Function(String message) error,
    required TResult Function(int secondsRemaining) coolDown,
    required TResult Function() emailVerified,
    required TResult Function() emailNotVerified,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? inProgress,
    TResult? Function(String message)? error,
    TResult? Function(int secondsRemaining)? coolDown,
    TResult? Function()? emailVerified,
    TResult? Function()? emailNotVerified,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? inProgress,
    TResult Function(String message)? error,
    TResult Function(int secondsRemaining)? coolDown,
    TResult Function()? emailVerified,
    TResult Function()? emailNotVerified,
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
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Error value) error,
    required TResult Function(_CoolDown value) coolDown,
    required TResult Function(_EmailVerified value) emailVerified,
    required TResult Function(_EmailNotVerified value) emailNotVerified,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoolDown value)? coolDown,
    TResult? Function(_EmailVerified value)? emailVerified,
    TResult? Function(_EmailNotVerified value)? emailNotVerified,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Error value)? error,
    TResult Function(_CoolDown value)? coolDown,
    TResult Function(_EmailVerified value)? emailVerified,
    TResult Function(_EmailNotVerified value)? emailNotVerified,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements EmailSentState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$InProgressImplCopyWith<$Res> {
  factory _$$InProgressImplCopyWith(
    _$InProgressImpl value,
    $Res Function(_$InProgressImpl) then,
  ) = __$$InProgressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InProgressImplCopyWithImpl<$Res>
    extends _$EmailSentStateCopyWithImpl<$Res, _$InProgressImpl>
    implements _$$InProgressImplCopyWith<$Res> {
  __$$InProgressImplCopyWithImpl(
    _$InProgressImpl _value,
    $Res Function(_$InProgressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmailSentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$InProgressImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$InProgressImpl implements _InProgress {
  const _$InProgressImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'EmailSentState.inProgress(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InProgressImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of EmailSentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InProgressImplCopyWith<_$InProgressImpl> get copyWith =>
      __$$InProgressImplCopyWithImpl<_$InProgressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) inProgress,
    required TResult Function(String message) error,
    required TResult Function(int secondsRemaining) coolDown,
    required TResult Function() emailVerified,
    required TResult Function() emailNotVerified,
  }) {
    return inProgress(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? inProgress,
    TResult? Function(String message)? error,
    TResult? Function(int secondsRemaining)? coolDown,
    TResult? Function()? emailVerified,
    TResult? Function()? emailNotVerified,
  }) {
    return inProgress?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? inProgress,
    TResult Function(String message)? error,
    TResult Function(int secondsRemaining)? coolDown,
    TResult Function()? emailVerified,
    TResult Function()? emailNotVerified,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Error value) error,
    required TResult Function(_CoolDown value) coolDown,
    required TResult Function(_EmailVerified value) emailVerified,
    required TResult Function(_EmailNotVerified value) emailNotVerified,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoolDown value)? coolDown,
    TResult? Function(_EmailVerified value)? emailVerified,
    TResult? Function(_EmailNotVerified value)? emailNotVerified,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Error value)? error,
    TResult Function(_CoolDown value)? coolDown,
    TResult Function(_EmailVerified value)? emailVerified,
    TResult Function(_EmailNotVerified value)? emailNotVerified,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class _InProgress implements EmailSentState {
  const factory _InProgress(final String message) = _$InProgressImpl;

  String get message;

  /// Create a copy of EmailSentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InProgressImplCopyWith<_$InProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$EmailSentStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmailSentState
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
    return 'EmailSentState.error(message: $message)';
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

  /// Create a copy of EmailSentState
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
    required TResult Function(String message) inProgress,
    required TResult Function(String message) error,
    required TResult Function(int secondsRemaining) coolDown,
    required TResult Function() emailVerified,
    required TResult Function() emailNotVerified,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? inProgress,
    TResult? Function(String message)? error,
    TResult? Function(int secondsRemaining)? coolDown,
    TResult? Function()? emailVerified,
    TResult? Function()? emailNotVerified,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? inProgress,
    TResult Function(String message)? error,
    TResult Function(int secondsRemaining)? coolDown,
    TResult Function()? emailVerified,
    TResult Function()? emailNotVerified,
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
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Error value) error,
    required TResult Function(_CoolDown value) coolDown,
    required TResult Function(_EmailVerified value) emailVerified,
    required TResult Function(_EmailNotVerified value) emailNotVerified,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoolDown value)? coolDown,
    TResult? Function(_EmailVerified value)? emailVerified,
    TResult? Function(_EmailNotVerified value)? emailNotVerified,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Error value)? error,
    TResult Function(_CoolDown value)? coolDown,
    TResult Function(_EmailVerified value)? emailVerified,
    TResult Function(_EmailNotVerified value)? emailNotVerified,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements EmailSentState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of EmailSentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CoolDownImplCopyWith<$Res> {
  factory _$$CoolDownImplCopyWith(
    _$CoolDownImpl value,
    $Res Function(_$CoolDownImpl) then,
  ) = __$$CoolDownImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int secondsRemaining});
}

/// @nodoc
class __$$CoolDownImplCopyWithImpl<$Res>
    extends _$EmailSentStateCopyWithImpl<$Res, _$CoolDownImpl>
    implements _$$CoolDownImplCopyWith<$Res> {
  __$$CoolDownImplCopyWithImpl(
    _$CoolDownImpl _value,
    $Res Function(_$CoolDownImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmailSentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? secondsRemaining = null}) {
    return _then(
      _$CoolDownImpl(
        secondsRemaining:
            null == secondsRemaining
                ? _value.secondsRemaining
                : secondsRemaining // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$CoolDownImpl implements _CoolDown {
  const _$CoolDownImpl({required this.secondsRemaining});

  @override
  final int secondsRemaining;

  @override
  String toString() {
    return 'EmailSentState.coolDown(secondsRemaining: $secondsRemaining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoolDownImpl &&
            (identical(other.secondsRemaining, secondsRemaining) ||
                other.secondsRemaining == secondsRemaining));
  }

  @override
  int get hashCode => Object.hash(runtimeType, secondsRemaining);

  /// Create a copy of EmailSentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoolDownImplCopyWith<_$CoolDownImpl> get copyWith =>
      __$$CoolDownImplCopyWithImpl<_$CoolDownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) inProgress,
    required TResult Function(String message) error,
    required TResult Function(int secondsRemaining) coolDown,
    required TResult Function() emailVerified,
    required TResult Function() emailNotVerified,
  }) {
    return coolDown(secondsRemaining);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? inProgress,
    TResult? Function(String message)? error,
    TResult? Function(int secondsRemaining)? coolDown,
    TResult? Function()? emailVerified,
    TResult? Function()? emailNotVerified,
  }) {
    return coolDown?.call(secondsRemaining);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? inProgress,
    TResult Function(String message)? error,
    TResult Function(int secondsRemaining)? coolDown,
    TResult Function()? emailVerified,
    TResult Function()? emailNotVerified,
    required TResult orElse(),
  }) {
    if (coolDown != null) {
      return coolDown(secondsRemaining);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Error value) error,
    required TResult Function(_CoolDown value) coolDown,
    required TResult Function(_EmailVerified value) emailVerified,
    required TResult Function(_EmailNotVerified value) emailNotVerified,
  }) {
    return coolDown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoolDown value)? coolDown,
    TResult? Function(_EmailVerified value)? emailVerified,
    TResult? Function(_EmailNotVerified value)? emailNotVerified,
  }) {
    return coolDown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Error value)? error,
    TResult Function(_CoolDown value)? coolDown,
    TResult Function(_EmailVerified value)? emailVerified,
    TResult Function(_EmailNotVerified value)? emailNotVerified,
    required TResult orElse(),
  }) {
    if (coolDown != null) {
      return coolDown(this);
    }
    return orElse();
  }
}

abstract class _CoolDown implements EmailSentState {
  const factory _CoolDown({required final int secondsRemaining}) =
      _$CoolDownImpl;

  int get secondsRemaining;

  /// Create a copy of EmailSentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoolDownImplCopyWith<_$CoolDownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailVerifiedImplCopyWith<$Res> {
  factory _$$EmailVerifiedImplCopyWith(
    _$EmailVerifiedImpl value,
    $Res Function(_$EmailVerifiedImpl) then,
  ) = __$$EmailVerifiedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmailVerifiedImplCopyWithImpl<$Res>
    extends _$EmailSentStateCopyWithImpl<$Res, _$EmailVerifiedImpl>
    implements _$$EmailVerifiedImplCopyWith<$Res> {
  __$$EmailVerifiedImplCopyWithImpl(
    _$EmailVerifiedImpl _value,
    $Res Function(_$EmailVerifiedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmailSentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmailVerifiedImpl implements _EmailVerified {
  const _$EmailVerifiedImpl();

  @override
  String toString() {
    return 'EmailSentState.emailVerified()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmailVerifiedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) inProgress,
    required TResult Function(String message) error,
    required TResult Function(int secondsRemaining) coolDown,
    required TResult Function() emailVerified,
    required TResult Function() emailNotVerified,
  }) {
    return emailVerified();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? inProgress,
    TResult? Function(String message)? error,
    TResult? Function(int secondsRemaining)? coolDown,
    TResult? Function()? emailVerified,
    TResult? Function()? emailNotVerified,
  }) {
    return emailVerified?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? inProgress,
    TResult Function(String message)? error,
    TResult Function(int secondsRemaining)? coolDown,
    TResult Function()? emailVerified,
    TResult Function()? emailNotVerified,
    required TResult orElse(),
  }) {
    if (emailVerified != null) {
      return emailVerified();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Error value) error,
    required TResult Function(_CoolDown value) coolDown,
    required TResult Function(_EmailVerified value) emailVerified,
    required TResult Function(_EmailNotVerified value) emailNotVerified,
  }) {
    return emailVerified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoolDown value)? coolDown,
    TResult? Function(_EmailVerified value)? emailVerified,
    TResult? Function(_EmailNotVerified value)? emailNotVerified,
  }) {
    return emailVerified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Error value)? error,
    TResult Function(_CoolDown value)? coolDown,
    TResult Function(_EmailVerified value)? emailVerified,
    TResult Function(_EmailNotVerified value)? emailNotVerified,
    required TResult orElse(),
  }) {
    if (emailVerified != null) {
      return emailVerified(this);
    }
    return orElse();
  }
}

abstract class _EmailVerified implements EmailSentState {
  const factory _EmailVerified() = _$EmailVerifiedImpl;
}

/// @nodoc
abstract class _$$EmailNotVerifiedImplCopyWith<$Res> {
  factory _$$EmailNotVerifiedImplCopyWith(
    _$EmailNotVerifiedImpl value,
    $Res Function(_$EmailNotVerifiedImpl) then,
  ) = __$$EmailNotVerifiedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmailNotVerifiedImplCopyWithImpl<$Res>
    extends _$EmailSentStateCopyWithImpl<$Res, _$EmailNotVerifiedImpl>
    implements _$$EmailNotVerifiedImplCopyWith<$Res> {
  __$$EmailNotVerifiedImplCopyWithImpl(
    _$EmailNotVerifiedImpl _value,
    $Res Function(_$EmailNotVerifiedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmailSentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmailNotVerifiedImpl implements _EmailNotVerified {
  const _$EmailNotVerifiedImpl();

  @override
  String toString() {
    return 'EmailSentState.emailNotVerified()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmailNotVerifiedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) inProgress,
    required TResult Function(String message) error,
    required TResult Function(int secondsRemaining) coolDown,
    required TResult Function() emailVerified,
    required TResult Function() emailNotVerified,
  }) {
    return emailNotVerified();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? inProgress,
    TResult? Function(String message)? error,
    TResult? Function(int secondsRemaining)? coolDown,
    TResult? Function()? emailVerified,
    TResult? Function()? emailNotVerified,
  }) {
    return emailNotVerified?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? inProgress,
    TResult Function(String message)? error,
    TResult Function(int secondsRemaining)? coolDown,
    TResult Function()? emailVerified,
    TResult Function()? emailNotVerified,
    required TResult orElse(),
  }) {
    if (emailNotVerified != null) {
      return emailNotVerified();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Error value) error,
    required TResult Function(_CoolDown value) coolDown,
    required TResult Function(_EmailVerified value) emailVerified,
    required TResult Function(_EmailNotVerified value) emailNotVerified,
  }) {
    return emailNotVerified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Error value)? error,
    TResult? Function(_CoolDown value)? coolDown,
    TResult? Function(_EmailVerified value)? emailVerified,
    TResult? Function(_EmailNotVerified value)? emailNotVerified,
  }) {
    return emailNotVerified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Error value)? error,
    TResult Function(_CoolDown value)? coolDown,
    TResult Function(_EmailVerified value)? emailVerified,
    TResult Function(_EmailNotVerified value)? emailNotVerified,
    required TResult orElse(),
  }) {
    if (emailNotVerified != null) {
      return emailNotVerified(this);
    }
    return orElse();
  }
}

abstract class _EmailNotVerified implements EmailSentState {
  const factory _EmailNotVerified() = _$EmailNotVerifiedImpl;
}
