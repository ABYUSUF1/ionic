import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/utils/enums/payment_method_enum.dart';
import 'package:ionic/features/address/presentation/manager/default_address/default_address_cubit.dart';
import 'package:ionic/features/payment/presentation/manager/cubit/payment_cubit.dart';

import '../../../../../core/utils/enums/delivery_instructions_enum.dart';

part 'checkout_state.dart';
part 'checkout_cubit.freezed.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit()
    : super(
        const CheckoutState(
          address: '',
          paymentMethod: null,
          deliveryInstruction: null,
        ),
      );

  void initialize(BuildContext context) {
    final address =
        context.read<DefaultAddressCubit>().defaultAddress?.address ?? '';
    emit(state.copyWith(address: address));
  }

  void setAddress(String address) {
    emit(state.copyWith(address: address));
  }

  void setPaymentMethod(PaymentMethodEnum method) {
    emit(state.copyWith(paymentMethod: method));
  }

  void setDeliveryInstruction(DeliveryInstructionsEnum instruction) {
    emit(state.copyWith(deliveryInstruction: instruction));
  }

  Future<void> placeOrder(BuildContext context, int amount) async {
    emit(state.copyWith(isLoading: true));

    if (state.paymentMethod == PaymentMethodEnum.cod) {
      emit(state.copyWith(isLoading: false));
    } else if (state.paymentMethod == PaymentMethodEnum.stripe) {
      await context.read<PaymentCubit>().payWithStripe(amount: amount);
      emit(state.copyWith(isLoading: false));
    }
  }
}
