part of 'checkout_cubit.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    required String address,
    required PaymentMethodEnum? paymentMethod,
    required DeliveryInstructionsEnum? deliveryInstruction,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _CheckoutState;

  const CheckoutState._();

  bool get canPlaceOrder =>
      address.isNotEmpty &&
      paymentMethod != null &&
      deliveryInstruction != null;
}

extension CheckoutValidation on CheckoutState {
  String? get canPlaceOrderReason {
    if (address.trim().isEmpty) {
      return LocaleKeys.checkout_error_no_address.tr();
    }
    if (deliveryInstruction == null) {
      return LocaleKeys.checkout_error_no_instruction.tr();
    }
    if (paymentMethod == null) {
      return LocaleKeys.checkout_error_no_payment.tr();
    }
    return null; // no issue
  }

  bool get canPlaceOrder => canPlaceOrderReason == null && !isLoading;
}
