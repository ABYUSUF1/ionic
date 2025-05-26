import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/auth/domain/entity/auth_entity.dart';
import 'package:ionic/features/auth/domain/repo/auth_repo.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo _authRepo;
  SignUpCubit(this._authRepo) : super(const SignUpState.initial());

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Signs up a user with email and password.
  Future<void> signUpWithEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      emit(const SignUpState.loading());
      final result = await _authRepo.signUpWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneNumberController.text,
      );
      result.fold((failure) => emit(SignUpState.error(failure.errMessage)), (
        authEntity,
      ) async {
        // Check if the user is verified
        if (!authEntity.isEmailVerified) {
          // Send verification email
          await sendEmailVerification(authEntity);
          return;
        }

        emit(SignUpState.success(authEntity));
      });
    }
  }

  Future<void> sendEmailVerification(AuthEntity authEntity) async {
    emit(const SignUpState.loading());
    final result = await _authRepo.sendEmailVerification();
    result.fold(
      (failure) => emit(SignUpState.error(failure.errMessage)),
      (_) => emit(SignUpState.success(authEntity)),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    return super.close();
  }
}
