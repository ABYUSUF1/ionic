import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/utils/enums/payment_method_enum.dart';
import 'package:ionic/features/address/presentation/manager/default_address/default_address_cubit.dart';
import 'package:ionic/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:ionic/features/payment/presentation/manager/cubit/payment_cubit.dart';

import '../../../../../core/utils/enums/delivery_instructions_enum.dart';
import '../../../../payment/presentation/views/paymob_payment_view.dart';

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

  DateTime? arrivesAt;

  void initialize(BuildContext context) {
    final address =
        context.read<DefaultAddressCubit>().defaultAddress?.address ?? '';

    final products = context.read<CartCubit>().cartEntity.cartProductsEntity;

    if (products.isNotEmpty) {
      final now = DateTime.now();

      // Find the product with the maximum deliveryDays
      final maxDeliveryDays = products
          .map((product) => product.productItem.deliveryDays)
          .reduce((a, b) => a > b ? a : b);

      arrivesAt = now.add(Duration(days: maxDeliveryDays));
    }

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

    final paymentCubit = context.read<PaymentCubit>();

    if (state.paymentMethod == PaymentMethodEnum.cod) {
      // Just simulate placing the order
      emit(state.copyWith(isLoading: false));
    } else if (state.paymentMethod == PaymentMethodEnum.stripe) {
      await paymentCubit.payWithStripe(amount: amount);
      emit(state.copyWith(isLoading: false));
    } else if (state.paymentMethod == PaymentMethodEnum.paymob) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: context.read<PaymentCubit>(),
                child: PaymobPaymentView(
                  totalPrice: amount,
                  onPaymentSuccess: () {
                    print('payment success');

                    // Navigator.pop(context, true);
                  },
                  onPaymentFailure: () {
                    print('payment failed');
                    // Navigator.pop(context, false);
                  },
                ),
              ),
        ),
      );

      emit(state.copyWith(isLoading: false));
    }
  }
}
