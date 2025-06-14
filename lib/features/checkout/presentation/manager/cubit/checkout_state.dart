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

extension CheckoutStateX on CheckoutState {
  CheckoutState copyWith({
    String? address,
    PaymentMethodEnum? paymentMethod,
    DeliveryInstructionsEnum? deliveryInstruction,
    bool? isLoading,
    String? errorMessage,
  }) {
    return CheckoutState(
      address: address ?? this.address,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      deliveryInstruction: deliveryInstruction ?? this.deliveryInstruction,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
