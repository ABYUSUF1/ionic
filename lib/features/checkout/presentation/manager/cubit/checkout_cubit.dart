import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/core/utils/enums/payment_method_enum.dart';
import 'package:ionic/core/widgets/snackbar/app_snackbar.dart';
import 'package:ionic/features/address/domain/entity/address_entity.dart';
import 'package:ionic/features/address/presentation/manager/default_address/default_address_cubit.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:ionic/features/orders/domain/repo/orders_repo.dart';
import 'package:ionic/features/payment/presentation/manager/cubit/payment_cubit.dart';

import '../../../../../core/utils/enums/delivery_instructions_enum.dart';
import '../../../../../core/utils/enums/order_status_enum.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../orders/domain/entity/orders_entity.dart';
import '../../../../payment/presentation/views/paymob_payment_view.dart';

part 'checkout_state.dart';
part 'checkout_cubit.freezed.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final OrdersRepo ordersRepo;
  CheckoutCubit(this.ordersRepo)
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
    if (state.paymentMethod == PaymentMethodEnum.cod) {
      await _checkoutWithCOD(context);
    } else if (state.paymentMethod == PaymentMethodEnum.stripe) {
      await _checkoutWithStripe(context, amount);
    } else if (state.paymentMethod == PaymentMethodEnum.paymob) {
      await _checkoutWithPaymob(context, amount);
    } else if (state.paymentMethod == PaymentMethodEnum.paypal) {
      AppSnackbar.showNoteSnackBar(
        context,
        LocaleKeys.checkout_paypal_not_supported.tr(),
      );
    }
  }

  OrdersEntity _createOrder(BuildContext context) {
    try {
      final user = context.read<AuthCubit>().cachedAuthEntity!;
      final cartCubit = context.read<CartCubit>();
      final addressCubit = context.read<DefaultAddressCubit>();
      final cartProducts = cartCubit.cartEntity.cartProductsEntity;
      final summary = cartCubit.state.whenOrNull(
        success: (_, summary) => summary,
      );

      final order = OrdersEntity(
        orderId: '',
        customerInfoEntity: addressCubit.defaultAddress!
            .toOrdersCustomerInfoEntity(user.id),
        paymentMethod: state.paymentMethod!,
        deliveryInstructions: state.deliveryInstruction!,
        arrivedAt: arrivesAt!,
        placedAt: DateTime.now(),
        products:
            cartProducts
                .map(
                  (e) => e.productItem.toOrdersProductEntity(
                    e.quantity,
                    e.returnPolicy,
                  ),
                )
                .toList(),
        summaryEntity: summary!,
        orderStatus: OrderStatusEnum.pending,
      );
      return order;
    } catch (e) {
      emit(
        state.copyWith(errorMessage: "Failed to create order: ${e.toString()}"),
      );
      rethrow;
    }
  }

  Future<void> _addToOrders(BuildContext context) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await ordersRepo.addOrder(_createOrder(context));
    result.fold(
      (failure) => emit(
        state.copyWith(errorMessage: failure.errMessage, isLoading: false),
      ),
      (orderId) => emit(state.copyWith(isLoading: false)),
    );
  }

  Future<void> _checkoutWithCOD(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    await _addToOrders(context);
    if (context.mounted) {
      context.read<CartCubit>().clearCart();
    }
    emit(state.copyWith(isLoading: false));

    if (context.mounted) {
      context.pushReplacementNamed(AppRouterName.checkoutSuccessRoute);
    }
  }

  Future<void> _checkoutWithPaymob(BuildContext context, int amount) async {
    final cartCubit = context.read<CartCubit>();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => BlocProvider.value(
              value: BlocProvider.of<PaymentCubit>(context),
              child: PaymobPaymentView(
                totalPrice: amount,
                onPaymentSuccess: () async {
                  emit(state.copyWith(isLoading: true));
                  await _addToOrders(context);
                  cartCubit.clearCart();
                  emit(state.copyWith(isLoading: false));

                  if (context.mounted) {
                    context.pushReplacementNamed(
                      AppRouterName.checkoutSuccessRoute,
                    );
                  }
                },
                onPaymentFailure: (error) {
                  emit(state.copyWith(errorMessage: error, isLoading: false));
                },
              ),
            ),
      ),
    );
  }

  Future<void> _checkoutWithStripe(BuildContext context, int amount) async {
    final paymentCubit = context.read<PaymentCubit>();
    final cartCubit = context.read<CartCubit>();

    emit(state.copyWith(isLoading: true));
    await paymentCubit.payWithStripe(amount: amount);
    if (context.mounted) {
      await _addToOrders(context);
    }
    cartCubit.clearCart();
    emit(state.copyWith(isLoading: false));

    if (context.mounted) {
      context.pushReplacementNamed(AppRouterName.checkoutSuccessRoute);
    }
  }
}
