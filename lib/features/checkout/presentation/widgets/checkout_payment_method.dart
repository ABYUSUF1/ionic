import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionic/features/checkout/presentation/widgets/checkout_custom_box.dart';
import 'package:ionic/generated/locale_keys.g.dart';

enum PaymentMethod { cod, stripe, paymob, paypal }

class CheckoutPaymentMethod extends StatefulWidget {
  const CheckoutPaymentMethod({super.key});

  @override
  State<CheckoutPaymentMethod> createState() => _CheckoutPaymentMethodState();
}

class _CheckoutPaymentMethodState extends State<CheckoutPaymentMethod> {
  PaymentMethod? selectedMethod;

  @override
  Widget build(BuildContext context) {
    return CheckoutCustomBox(
      title: context.tr(LocaleKeys.checkout_payment_method),
      child: Column(
        children: [
          RadioListTile<PaymentMethod>(
            title: const Text("Cash on Delivery (COD)"),
            value: PaymentMethod.cod,
            groupValue: selectedMethod,
            onChanged: (value) {
              setState(() {
                selectedMethod = value;
              });
            },
          ),
          RadioListTile<PaymentMethod>(
            title: const Text("Stripe"),
            value: PaymentMethod.stripe,
            groupValue: selectedMethod,
            onChanged: (value) {
              setState(() {
                selectedMethod = value;
              });
            },
          ),
          RadioListTile<PaymentMethod>(
            title: const Text("Paymob"),
            value: PaymentMethod.paymob,
            groupValue: selectedMethod,
            onChanged: (value) {
              setState(() {
                selectedMethod = value;
              });
            },
          ),
          RadioListTile<PaymentMethod>(
            title: const Text("PayPal"),
            value: PaymentMethod.paypal,
            groupValue: selectedMethod,
            onChanged: (value) {
              setState(() {
                selectedMethod = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
