import 'package:dartz/dartz.dart';
import 'package:ionic/core/utils/errors/failure.dart';
import 'package:ionic/features/payment/data/data_source/stripe_payment_service.dart';

import '../../domain/repo/payment_repo.dart';

class PaymentRepoImpl implements PaymentRepo {
  final StripePaymentService _stripePaymentService;

  PaymentRepoImpl(this._stripePaymentService);

  @override
  Future<Either<Failure, void>> payWithPayPal({required int amount}) {
    // TODO: implement payWithPayPal
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> payWithPaymob({required int amount}) {
    // TODO: implement payWithPaymob
    throw UnimplementedError();
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
