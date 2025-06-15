import 'package:dartz/dartz.dart';
import 'package:ionic/core/utils/errors/failure.dart';
import 'package:ionic/features/payment/data/models/paymob_billing_data_model.dart';
import 'package:ionic/features/payment/data/models/paymob_items_model.dart';

abstract class PaymentRepo {
  Future<Either<Failure, void>> payWithStripe({required int amount});
  Future<Either<Failure, void>> payWithPayPal({required int amount});
  Future<Either<Failure, Map<String, dynamic>>> payWithPaymob({
    required int amount,
    required List<PaymobItemsModel> items,
    required PaymobBillingDataModel billingData,
  });
}
