import 'package:dartz/dartz.dart';
import 'package:ionic/core/utils/errors/failure.dart';
import 'package:ionic/features/payment/data/data_source/paymob_payment_service.dart';
import 'package:ionic/features/payment/data/data_source/stripe_payment_service.dart';

import '../../domain/repo/payment_repo.dart';
import '../models/paymob_billing_data_model.dart';
import '../models/paymob_items_model.dart';

class PaymentRepoImpl implements PaymentRepo {
  final StripePaymentService _stripePaymentService;
  final PaymobPaymentService _paymobPaymentService;

  PaymentRepoImpl(this._stripePaymentService, this._paymobPaymentService);

  @override
  Future<Either<Failure, void>> payWithPayPal({required int amount}) {
    // TODO: implement payWithPayPal
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> payWithPaymob({
    required int amount,
    required List<PaymobItemsModel> items,
    required PaymobBillingDataModel billingData,
  }) async {
    try {
      final result = await _paymobPaymentService.createPaymentIntent(
        totalPrice: amount,
        items: items,
        billingData: billingData,
      );
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> payWithStripe({required int amount}) async {
    try {
      final result = await _stripePaymentService.pay(amount: amount);
      return result.fold((failure) => Left(failure), (_) => const Right(null));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
