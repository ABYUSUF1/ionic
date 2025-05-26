import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/auth/domain/entity/auth_entity.dart';
import 'package:ionic/features/auth/domain/repo/auth_repo.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepo _authRepo;
  SignInCubit(this._authRepo) : super(const SignInState.initial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signInWithEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      emit(const SignInState.loading());

      final result = await _authRepo.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      result.fold((failure) => emit(SignInState.error(failure.errMessage)), (
        authEntity,
      ) async {
        // Check if the user is verified
        if (!authEntity.isEmailVerified) {
          // Send verification email
          await sendEmailVerification();
          return;
        }

        emit(SignInState.success(authEntity));
      });
    }
  }

  Future<void> signInWithGoogle() async {
    emit(const SignInState.loading());
    final result = await _authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(SignInState.error(failure.errMessage)),
      (authEntity) => emit(SignInState.success(authEntity)),
    );
  }

  Future<void> sendEmailVerification() async {
    emit(const SignInState.loading());
    final result = await _authRepo.sendEmailVerification();
    result.fold(
      (failure) => emit(SignInState.error(failure.errMessage)),
      (_) => emit(const SignInState.emailNotVerified()),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
