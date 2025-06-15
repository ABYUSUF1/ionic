part of 'payment_cubit.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.initial() = _Initial;
  const factory PaymentState.loading() = _Loading;
  const factory PaymentState.success() = _Success;
  const factory PaymentState.error() = _Error;

  // For paymob: you might need to return data like payment_url
  const factory PaymentState.paymobReady(Map<String, dynamic> data) =
      _PaymobReady;
}
