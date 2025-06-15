import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/payment/domain/repo/payment_repo.dart';

part 'payment_state.dart';
part 'payment_cubit.freezed.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepo _paymentRepo;
  PaymentCubit(this._paymentRepo) : super(const PaymentState.initial());

  Future<void> payWithStripe({required int amount}) async {
    emit(const PaymentState.loading());
    final result = await _paymentRepo.payWithStripe(amount: amount);
    result.fold(
      (l) => emit(const PaymentState.error()),
      (r) => emit(const PaymentState.success()),
    );
  }
}
