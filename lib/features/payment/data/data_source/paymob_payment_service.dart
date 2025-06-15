import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ionic/features/payment/data/models/paymob_billing_data_model.dart';
import 'package:ionic/features/payment/data/models/paymob_items_model.dart';

import '../../../../core/api/api_client.dart';
import '../../../../core/utils/errors/failure.dart';
import '../../../../core/utils/errors/server_failure.dart';

class PaymobPaymentService {
  final ApiClient _apiClient;
  PaymobPaymentService(this._apiClient);

  static const _createPaymentIntention =
      'https://accept.paymob.com/v1/intention/';
  static const _authToken = 'https://accept.paymob.com/api/auth/tokens';
  static const _getOrderStatus =
      'https://accept.paymob.com/api/ecommerce/orders/transaction_inquiry';

  Future<Either<Failure, Map<String, dynamic>>> createPaymentIntention({
    required String secretKey,
    required int totalPrice,
    required int integrationId,
    required List<PaymobItemsModel>? items,
    required PaymobBillingDataModel? billingData,
  }) async {
    final amount = _calculateAmount(totalPrice);
    final serializedItems = items?.map((e) => e.toJson()).toList() ?? [];
    final serializedBillingData =
        billingData?.toJson() ?? PaymobBillingDataModel().toJson();

    try {
      final response = await _apiClient.post(
        _createPaymentIntention,
        data: {
          "amount": amount,
          "currency": 'egp',
          "payment_methods": [integrationId],
          "items": serializedItems,
          "billing_data": serializedBillingData,
        },
        headers: {"Authorization": "Token $secretKey"},
      );

      return Right({
        "client_secret": response.data['client_secret'],
        "order_id": response.data['intention_order_id'],
      });
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return const Left(
        Failure("An unexpected error occurred. Please contact support."),
      );
    }
  }

  Future<Either<Failure, String>> authToken({required String apiKey}) async {
    try {
      final response = await _apiClient.post(
        _authToken,
        data: {"api_key": apiKey},
      );
      return Right(response.data['token']);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return const Left(
        Failure("An unexpected error occurred. Please contact support."),
      );
    }
  }

  Future<Either<Failure, bool>> getPaymentStatus({
    required String authToken,
    required String orderId,
  }) async {
    try {
      final response = await _apiClient.post(
        _getOrderStatus,
        headers: {"Authorization": authToken},
        data: {"order_id": orderId},
      );

      if (response.data.containsKey('success')) {
        return Right(response.data['success']);
      }
      return const Left(Failure("Payment status not available."));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return const Left(
        Failure("An unexpected error occurred. Please contact support."),
      );
    }
  }

  int _calculateAmount(int totalPrice) {
    return totalPrice * 100;
  }
}
