import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/payment/domain/repo/payment_repo.dart';

import '../../../data/models/paymob_billing_data_model.dart';
import '../../../data/models/paymob_items_model.dart';

part 'payment_state.dart';
part 'payment_cubit.freezed.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepo _paymentRepo;
  PaymentCubit(this._paymentRepo) : super(const PaymentState.initial());

  Future<void> payWithStripe({required int amount}) async {
    emit(const PaymentState.loading());
    final result = await _paymentRepo.payWithStripe(amount: amount);
    result.fold(
      (l) => emit(PaymentState.error(l.errMessage)),
      (r) => emit(const PaymentState.success()),
    );
  }

  Future<Map<String, dynamic>?> payWithPaymob({
    required int amount,
    required List<PaymobItemsModel> items,
    required PaymobBillingDataModel billingData,
  }) async {
    emit(const PaymentState.loading());

    final result = await _paymentRepo.payWithPaymob(
      amount: amount,
      items: items,
      billingData: billingData,
    );

    return result.fold(
      (failure) {
        final error = failure.errMessage;
        emit(PaymentState.error(error));
        throw Exception(error); // ✅ Now throw the message
      },
      (data) {
        if (data['payment_url'] == null) {
          const error = 'No payment URL received';
          emit(const PaymentState.error(error));
          throw Exception(error); // ✅ This too
        }
        emit(const PaymentState.initial()); // reset state
        return data;
      },
    );
  }
}
