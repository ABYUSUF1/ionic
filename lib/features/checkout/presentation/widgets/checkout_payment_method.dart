import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/utils/enums/payment_method_enum.dart';
import 'package:ionic/features/checkout/presentation/widgets/checkout_custom_box.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../manager/cubit/checkout_cubit.dart';

class CheckoutPaymentMethod extends StatelessWidget {
  const CheckoutPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedMethod = context.watch<CheckoutCubit>().state.paymentMethod;

    final methods = [
      {
        'type': PaymentMethodEnum.cod,
        'label': context.tr(LocaleKeys.checkout_cash_on_delivery),
      },
      {'type': PaymentMethodEnum.stripe, 'label': 'Stripe'},
      {'type': PaymentMethodEnum.paymob, 'label': 'Paymob'},
      {'type': PaymentMethodEnum.paypal, 'label': 'Paypal'},
    ];

    return CheckoutCustomBox(
      title: context.tr(LocaleKeys.checkout_payment_method),
      child: Column(
        children:
            methods.map((method) {
              final type = method['type'] as PaymentMethodEnum;
              final label = method['label'] as String;
              return RadioListTile<PaymentMethodEnum>(
                title: Text(label),
                value: type,
                groupValue: selectedMethod,
                onChanged: (value) {
                  if (value != null) {
                    context.read<CheckoutCubit>().setPaymentMethod(value);
                  }
                },
              );
            }).toList(),
      ),
    );
  }
}
