import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/core/utils/enums/payment_method_enum.dart';
import 'package:ionic/core/widgets/snackbar/app_snackbar.dart';
import 'package:ionic/features/address/presentation/manager/default_address/default_address_cubit.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:ionic/features/orders/presentation/manager/cubit/orders_cubit.dart';
import 'package:ionic/features/payment/presentation/manager/cubit/payment_cubit.dart';

import '../../../../../core/utils/enums/delivery_instructions_enum.dart';
import '../../../../../core/utils/enums/order_status_enum.dart';
import '../../../../orders/domain/entity/orders_entity.dart';
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

    final paymentSuccessful = await _handlePayment(context, amount);

    // Stop flow if payment failed or was handled via navigator (Paymob)
    if (!paymentSuccessful || state.paymentMethod == PaymentMethodEnum.paymob) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    if (context.mounted) {
      await _createOrder(context);
      if (context.mounted) {
        context.read<CartCubit>().clearCart();
      }
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<bool> _handlePayment(BuildContext context, int amount) async {
    final paymentCubit = context.read<PaymentCubit>();

    switch (state.paymentMethod!) {
      case PaymentMethodEnum.cod:
        return true;

      case PaymentMethodEnum.stripe:
        await paymentCubit.payWithStripe(amount: amount);
        return true;

      case PaymentMethodEnum.paymob:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => BlocProvider.value(
                  value: paymentCubit,
                  child: PaymobPaymentView(
                    totalPrice: amount,
                    onPaymentSuccess: () async {
                      await _createOrder(context);
                    },
                    onPaymentFailure: () {
                      if (context.mounted) {
                        emit(state.copyWith(errorMessage: "Payment Failed"));
                      }
                    },
                  ),
                ),
          ),
        );
        return false;

      case PaymentMethodEnum.paypal:
        AppSnackbar.showNoteSnackBar(context, "Paypal is coming Soon...");
        return false;
    }
  }

  Future<void> _createOrder(BuildContext context) async {
    final user = context.read<AuthCubit>().cachedAuthEntity!;
    final cartCubit = context.read<CartCubit>();
    final cartProducts = cartCubit.cartEntity.cartProductsEntity;
    final tuple = cartCubit.state.whenOrNull(
      success: (_, summary) => (summary.totalPrice, summary.totalQuantity),
    );

    final order = OrdersEntity(
      orderId: '', // Firebase will generate this
      userId: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      phoneNumber: user.phoneNumber!,
      address: state.address,
      paymentMethod: state.paymentMethod!,
      deliveryInstructions: state.deliveryInstruction!,
      arrivedAt: arrivesAt!,
      createdAt: DateTime.now(),
      products:
          cartProducts
              .map((e) => e.productItem.toOrdersProductEntity(e.quantity))
              .toList(),
      totalPrice: tuple?.$1 ?? 0.0,
      totalQuantity: tuple?.$2 ?? 0,
      orderStatus: OrderStatusEnum.pending,
    );

    await context.read<OrdersCubit>().addToOrders(order);
  }
}
