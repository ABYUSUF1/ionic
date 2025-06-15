import 'package:ionic/core/constants/supabase_edge_function.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/paymob_billing_data_model.dart';
import '../models/paymob_items_model.dart';

class PaymobPaymentService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<Map<String, dynamic>> createPaymentIntent({
    required int totalPrice,
    required List<PaymobItemsModel> items,
    required PaymobBillingDataModel billingData,
  }) async {
    final response = await _supabase.functions.invoke(
      SupabaseEdgeFunction.paymobCreateIntent,
      body: {
        'totalPrice': totalPrice,
        'items': items.map((e) => e.toJson()).toList(),
        'billingData': billingData.toJson(),
      },
    );

    return response.data;
  }

  // I dont use it, but it still a way to check if the payment is successful
  // it will be determined in your WebView via onLoadStop already...
  Future<bool> verifyPayment({required String orderId}) async {
    final res = await _supabase.functions.invoke(
      SupabaseEdgeFunction.paymobVerifyIntent,
      body: {'order_id': orderId},
    );
    return res.data['success'] == true;
  }
}
