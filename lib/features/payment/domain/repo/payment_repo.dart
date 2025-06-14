import 'package:dartz/dartz.dart';
import 'package:ionic/core/utils/errors/failure.dart';

abstract class PaymentRepo {
  Future<Either<Failure, void>> payWithStripe({required int amount});
  Future<Either<Failure, void>> payWithPayPal({required int amount});
  Future<Either<Failure, void>> payWithPaymob({required int amount});
}
