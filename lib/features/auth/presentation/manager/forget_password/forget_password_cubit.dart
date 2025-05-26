import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/auth/domain/repo/auth_repo.dart';

part 'forget_password_state.dart';
part 'forget_password_cubit.freezed.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final AuthRepo _authRepo;
  ForgetPasswordCubit(this._authRepo)
    : super(const ForgetPasswordState.initial());

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Send password reset email
  Future<void> sendPasswordReset() async {
    if (formKey.currentState!.validate()) {
      emit(const ForgetPasswordState.loading());

      final result = await _authRepo.sendPasswordResetEmail(
        emailController.text.trim(),
      );
      result.fold(
        (failure) => emit(ForgetPasswordState.error(failure.errMessage)),
        (_) => emit(const ForgetPasswordState.success()),
      );
    }
  }
}
