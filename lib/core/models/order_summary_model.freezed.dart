// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderSummaryModel _$OrderSummaryModelFromJson(Map<String, dynamic> json) {
  return _OrderSummaryModel.fromJson(json);
}

/// @nodoc
mixin _$OrderSummaryModel {
  int get totalQuantity => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get totalFees => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  double get totalDiscountedPrice => throw _privateConstructorUsedError;

  /// Serializes this OrderSummaryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderSummaryModelCopyWith<OrderSummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSummaryModelCopyWith<$Res> {
  factory $OrderSummaryModelCopyWith(
    OrderSummaryModel value,
    $Res Function(OrderSummaryModel) then,
  ) = _$OrderSummaryModelCopyWithImpl<$Res, OrderSummaryModel>;
  @useResult
  $Res call({
    int totalQuantity,
    double subtotal,
    double totalFees,
    double totalPrice,
    double totalDiscountedPrice,
  });
}

/// @nodoc
class _$OrderSummaryModelCopyWithImpl<$Res, $Val extends OrderSummaryModel>
    implements $OrderSummaryModelCopyWith<$Res> {
  _$OrderSummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuantity = null,
    Object? subtotal = null,
    Object? totalFees = null,
    Object? totalPrice = null,
    Object? totalDiscountedPrice = null,
  }) {
    return _then(
      _value.copyWith(
            totalQuantity:
                null == totalQuantity
                    ? _value.totalQuantity
                    : totalQuantity // ignore: cast_nullable_to_non_nullable
                        as int,
            subtotal:
                null == subtotal
                    ? _value.subtotal
                    : subtotal // ignore: cast_nullable_to_non_nullable
                        as double,
            totalFees:
                null == totalFees
                    ? _value.totalFees
                    : totalFees // ignore: cast_nullable_to_non_nullable
                        as double,
            totalPrice:
                null == totalPrice
                    ? _value.totalPrice
                    : totalPrice // ignore: cast_nullable_to_non_nullable
                        as double,
            totalDiscountedPrice:
                null == totalDiscountedPrice
                    ? _value.totalDiscountedPrice
                    : totalDiscountedPrice // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderSummaryModelImplCopyWith<$Res>
    implements $OrderSummaryModelCopyWith<$Res> {
  factory _$$OrderSummaryModelImplCopyWith(
    _$OrderSummaryModelImpl value,
    $Res Function(_$OrderSummaryModelImpl) then,
  ) = __$$OrderSummaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalQuantity,
    double subtotal,
    double totalFees,
    double totalPrice,
    double totalDiscountedPrice,
  });
}

/// @nodoc
class __$$OrderSummaryModelImplCopyWithImpl<$Res>
    extends _$OrderSummaryModelCopyWithImpl<$Res, _$OrderSummaryModelImpl>
    implements _$$OrderSummaryModelImplCopyWith<$Res> {
  __$$OrderSummaryModelImplCopyWithImpl(
    _$OrderSummaryModelImpl _value,
    $Res Function(_$OrderSummaryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuantity = null,
    Object? subtotal = null,
    Object? totalFees = null,
    Object? totalPrice = null,
    Object? totalDiscountedPrice = null,
  }) {
    return _then(
      _$OrderSummaryModelImpl(
        totalQuantity:
            null == totalQuantity
                ? _value.totalQuantity
                : totalQuantity // ignore: cast_nullable_to_non_nullable
                    as int,
        subtotal:
            null == subtotal
                ? _value.subtotal
                : subtotal // ignore: cast_nullable_to_non_nullable
                    as double,
        totalFees:
            null == totalFees
                ? _value.totalFees
                : totalFees // ignore: cast_nullable_to_non_nullable
                    as double,
        totalPrice:
            null == totalPrice
                ? _value.totalPrice
                : totalPrice // ignore: cast_nullable_to_non_nullable
                    as double,
        totalDiscountedPrice:
            null == totalDiscountedPrice
                ? _value.totalDiscountedPrice
                : totalDiscountedPrice // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderSummaryModelImpl implements _OrderSummaryModel {
  const _$OrderSummaryModelImpl({
    required this.totalQuantity,
    required this.subtotal,
    required this.totalFees,
    required this.totalPrice,
    required this.totalDiscountedPrice,
  });

  factory _$OrderSummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderSummaryModelImplFromJson(json);

  @override
  final int totalQuantity;
  @override
  final double subtotal;
  @override
  final double totalFees;
  @override
  final double totalPrice;
  @override
  final double totalDiscountedPrice;

  @override
  String toString() {
    return 'OrderSummaryModel(totalQuantity: $totalQuantity, subtotal: $subtotal, totalFees: $totalFees, totalPrice: $totalPrice, totalDiscountedPrice: $totalDiscountedPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderSummaryModelImpl &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.totalFees, totalFees) ||
                other.totalFees == totalFees) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.totalDiscountedPrice, totalDiscountedPrice) ||
                other.totalDiscountedPrice == totalDiscountedPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalQuantity,
    subtotal,
    totalFees,
    totalPrice,
    totalDiscountedPrice,
  );

  /// Create a copy of OrderSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderSummaryModelImplCopyWith<_$OrderSummaryModelImpl> get copyWith =>
      __$$OrderSummaryModelImplCopyWithImpl<_$OrderSummaryModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderSummaryModelImplToJson(this);
  }
}

abstract class _OrderSummaryModel implements OrderSummaryModel {
  const factory _OrderSummaryModel({
    required final int totalQuantity,
    required final double subtotal,
    required final double totalFees,
    required final double totalPrice,
    required final double totalDiscountedPrice,
  }) = _$OrderSummaryModelImpl;

  factory _OrderSummaryModel.fromJson(Map<String, dynamic> json) =
      _$OrderSummaryModelImpl.fromJson;

  @override
  int get totalQuantity;
  @override
  double get subtotal;
  @override
  double get totalFees;
  @override
  double get totalPrice;
  @override
  double get totalDiscountedPrice;

  /// Create a copy of OrderSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderSummaryModelImplCopyWith<_$OrderSummaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
