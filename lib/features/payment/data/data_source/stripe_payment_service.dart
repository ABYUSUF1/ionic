import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:ionic/core/api/api_client.dart';
import 'package:ionic/core/utils/errors/failure.dart';
import 'package:ionic/features/payment/data/data_source/payment_service.dart';

import '../../../../core/utils/errors/server_failure.dart';

class StripePaymentService {
  final ApiClient _apiClient;
  final Stripe stripe = Stripe.instance;

  StripePaymentService(this._apiClient);

  static const String _createPaymentIntentUrl =
      'https://api.stripe.com/v1/payment_intents';

  Future<Either<Failure, void>> pay({
    required int amount,
    required String secretKey,
  }) async {
    try {
      final String clientSecret = await createPaymentIntent(
        amount: amount,
        secretKey: secretKey,
      );

      await _initPaymentSheet(clientSecret: clientSecret);

      await _presentPaymentSheet();

      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else if (e is StripeException) {
        return Left(Failure('Payment failed: ${e.error.localizedMessage}'));
      } else {
        return const Left(
          Failure('An unexpected error occurred. Please contact support.'),
        );
      }
    }
  }

  Future<String> createPaymentIntent({
    required String secretKey,
    required int amount,
  }) async {
    final response = await _apiClient.post(
      _createPaymentIntentUrl,
      headers: {
        'Authorization': 'Bearer $secretKey',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      data: {'amount': amount * 100},
    );
    return response.data['client_secret'];
  }

  Future<void> _initPaymentSheet({required String clientSecret}) async {
    await stripe.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: 'Ionic',
      ),
    );
  }

  Future<void> _presentPaymentSheet() async {
    await stripe.presentPaymentSheet();
  }
}
