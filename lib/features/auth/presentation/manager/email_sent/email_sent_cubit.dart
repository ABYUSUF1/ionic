import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/core/widgets/snackbar/app_snackbar.dart';
import 'package:ionic/features/auth/domain/repo/auth_repo.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/widgets/dialog/custom_dialog.dart';

part 'email_sent_state.dart';
part 'email_sent_cubit.freezed.dart';

class EmailSentCubit extends Cubit<EmailSentState> {
  final AuthRepo _authRepo;
  EmailSentCubit(this._authRepo)
    : super(const EmailSentState.coolDown(secondsRemaining: 90)) {
    _startCoolDownTimer();
  }

  Timer? _timer;

  /// Main method called to resend verification email
  Future<void> resendEmail(String email, bool isPasswordReset) async {
    // Show loading state
    emit(
      EmailSentState.inProgress(
        isPasswordReset
            ? LocaleKeys.auth_we_sent_you_an_email_to_reset_your_password.tr()
            : LocaleKeys.auth_we_sent_you_an_email_to_verify_your_account.tr(),
      ),
    );

    isPasswordReset
        ? await passwordReset(email)
        : await sendEmailVerification();
  }

  void _startCoolDownTimer() {
    int seconds = 90;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds--;
      if (seconds <= 0) {
        timer.cancel();
        emit(const EmailSentState.initial());
      } else {
        emit(EmailSentState.coolDown(secondsRemaining: seconds));
      }
    });
  }

  /// Allow manual reset if needed
  void resetTimer() {
    _timer?.cancel();
    emit(const EmailSentState.initial());
  }

  // Send email verification email
  Future<void> sendEmailVerification() async {
    final result = await _authRepo.sendEmailVerification();
    result.fold((failure) => emit(EmailSentState.error(failure.errMessage)), (
      _,
    ) {
      // On success, start cool down
      emit(const EmailSentState.coolDown(secondsRemaining: 90));
      _startCoolDownTimer();
    });
  }

  // Check if email has been verified
  Future<void> isEmailVerified() async {
    final result = await _authRepo.isEmailVerified();
    result.fold((failure) => emit(EmailSentState.error(failure.errMessage)), (
      isVerified,
    ) {
      if (isVerified) {
        emit(const EmailSentState.emailVerified());
      } else {
        emit(const EmailSentState.emailNotVerified());
      }
    });
  }

  /// Send password reset email
  Future<void> passwordReset(String email) async {
    final result = await _authRepo.sendPasswordResetEmail(email);
    result.fold((failure) => emit(EmailSentState.error(failure.errMessage)), (
      _,
    ) {
      // On success, start cool down
      emit(const EmailSentState.coolDown(secondsRemaining: 90));
      _startCoolDownTimer();
    });
  }

  /// Handle email verification pop
  Future<void> handleEmailVerificationPop(
    BuildContext context,
    ThemeData theme,
  ) async {
    /// Check if email has been verified
    final result = await _authRepo.isEmailVerified();
    if (!context.mounted) return;
    result.fold((failure) => context.pop(), (isVerified) async {
      if (isVerified) {
        await _authRepo.updateUserEmailVerified(true);

        if (!context.mounted) return;
        AppSnackbar.showSuccessSnackBar(
          context,
          LocaleKeys.auth_email_verified_successfully.tr(),
        );

        if (context.mounted) {
          context.push(AppRouterName.signInRoute);
        }
      } else {
        showCustomDialog(
          context: context,
          title: LocaleKeys.auth_email_not_verified.tr(),
          subTitle: LocaleKeys.auth_email_not_verified_desc.tr(),
          svgPic:
              theme.brightness == Brightness.light
                  ? AppAssets.illustrationsLoginIllustrationLight
                  : AppAssets.illustrationsLoginIllustrationDark,
          buttonText: LocaleKeys.auth_back_anyway.tr(),
          onTap: () {
            context.go(AppRouterName.signInRoute);
          },
        );
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
