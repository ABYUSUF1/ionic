import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:ionic/core/api/api_client.dart';
import 'package:ionic/core/theme/app_colors.dart';
import 'package:ionic/core/utils/errors/failure.dart';

import '../../../../core/utils/errors/server_failure.dart';

class StripePaymentService {
  final ApiClient _apiClient;

  StripePaymentService(this._apiClient);

  final Stripe stripe = Stripe.instance;
  final String supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY']!;

  Future<Either<Failure, void>> pay({required int amount}) async {
    try {
      final String clientSecret = await createPaymentIntent(amount: amount);

      await _initPaymentSheet(clientSecret: clientSecret);

      await _presentPaymentSheet();

      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else if (e is StripeException) {
        return Left(
          Failure('Stripe Payment failed: ${e.error.localizedMessage}'),
        );
      } else {
        return const Left(Failure('An unexpected error occurred'));
      }
    }
  }

  Future<String> createPaymentIntent({required int amount}) async {
    final response = await _apiClient.post(
      'https://mhnckorjmoadgsbjirdd.supabase.co/functions/v1/create-stripe-payment-intent',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $supabaseAnonKey',
      },
      data: {'amount': amount * 100, 'currency': 'egp'},
    );

    return response.data['clientSecret'];
  }

  Future<void> _initPaymentSheet({required String clientSecret}) async {
    await stripe.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: 'Ionic',
        appearance: const PaymentSheetAppearance(
          colors: PaymentSheetAppearanceColors(primary: AppColors.primaryColor),
        ),
      ),
    );
  }

  Future<void> _presentPaymentSheet() async {
    await stripe.presentPaymentSheet();
  }
}
