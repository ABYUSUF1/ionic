import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:ionic/core/theme/app_colors.dart';
import 'package:ionic/core/widgets/loading/normal_loading.dart';
import 'package:ionic/features/payment/data/models/paymob_billing_data_model.dart';
import 'package:ionic/features/payment/data/models/paymob_items_model.dart';
import 'package:ionic/features/payment/presentation/manager/cubit/payment_cubit.dart';

class PaymobPaymentView extends StatefulWidget {
  final int totalPrice;
  final List<PaymobItemsModel>? items;
  final PaymobBillingDataModel? billingData;
  final VoidCallback onPaymentSuccess;
  final void Function(String error) onPaymentFailure;

  const PaymobPaymentView({
    super.key,
    required this.totalPrice,
    required this.onPaymentSuccess,
    required this.onPaymentFailure,
    this.items,
    this.billingData,
  });

  @override
  State<PaymobPaymentView> createState() => _PaymobPaymentViewState();
}

class _PaymobPaymentViewState extends State<PaymobPaymentView> {
  String? paymentUrl;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _initiatePayment();
  }

  Future<void> _initiatePayment() async {
    final cubit = context.read<PaymentCubit>();
    try {
      final result = await cubit.payWithPaymob(
        amount: widget.totalPrice,
        items: widget.items ?? [],
        billingData: widget.billingData ?? PaymobBillingDataModel(),
      );

      if (result != null && result['payment_url'] != null) {
        setState(() {
          paymentUrl = result['payment_url'];
        });
      } else {
        widget.onPaymentFailure("Missing payment URL.");
      }
    } catch (e) {
      widget.onPaymentFailure(e.toString()); // ✅ Now it shows the real error
    }
  }

  void _handleLoadStop(Uri? url) {
    if (url == null) return;

    final success = url.queryParameters['success'];
    if (success == "true") {
      widget.onPaymentSuccess();
    } else if (success == "false") {
      widget.onPaymentFailure("Payment failed or was canceled.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(title: const Text("Paymob Payment")),
      body:
          paymentUrl == null
              ? const Center(
                child: NormalLoading(
                  width: 80,
                  height: 80,
                  color: AppColors.primaryColor,
                ),
              )
              : Stack(
                children: [
                  InAppWebView(
                    initialUrlRequest: URLRequest(url: WebUri(paymentUrl!)),
                    onLoadStop: (controller, url) => _handleLoadStop(url),
                    onProgressChanged: (controller, progress) {
                      setState(() {
                        _progress = progress / 100;
                      });
                    },
                  ),
                  if (_progress < 1.0)
                    LinearProgressIndicator(
                      value: _progress,
                      color: AppColors.primaryColor,
                      backgroundColor: AppColors.primaryColor.withValues(
                        alpha: .2,
                      ),
                    ),
                ],
              ),
    );
  }
}
