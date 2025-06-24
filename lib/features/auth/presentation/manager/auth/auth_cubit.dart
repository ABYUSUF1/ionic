import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/auth/domain/entity/auth_entity.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../domain/repo/auth_repo.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;
  AuthCubit(this._authRepo) : super(const AuthState.initial()) {
    checkAuthStatus();
  }

  AuthEntity? cachedAuthEntity;

  void updateUserData(AuthEntity newEntity) {
    emit(AuthState.authenticated(newEntity));
    cachedAuthEntity = newEntity;
  }

  /// Check Auth Status..
  Future<void> checkAuthStatus() async {
    if (cachedAuthEntity != null) {
      emit(AuthState.authenticated(cachedAuthEntity!));
      return;
    }

    emit(const AuthState.loading(''));
    final result = await _authRepo.getCurrentUser();

    result.fold((failure) => emit(AuthState.error(failure.errMessage)), (
      authEntity,
    ) {
      if (authEntity != null && authEntity.isEmailVerified) {
        emit(AuthState.authenticated(authEntity));
        cachedAuthEntity = authEntity;
      } else {
        emit(const AuthState.unAuthenticated());
        cachedAuthEntity = null;
      }
    });
  }

  /// Sign in with google
  Future<void> signInWithGoogle(BuildContext context) async {
    emit(AuthState.loading(context.tr(LocaleKeys.auth_signing_with_google)));
    final result = await _authRepo.signInWithGoogle();
    result.fold((failure) => emit(AuthState.error(failure.errMessage)), (
      authEntity,
    ) {
      if (authEntity.isEmailVerified) {
        emit(AuthState.authenticated(authEntity));
        cachedAuthEntity = authEntity;
      } else {
        // Email is not verified
        emit(const AuthState.unAuthenticated());
        cachedAuthEntity = null;
      }
    });
  }

  /// Logout
  Future<void> signOut(BuildContext context) async {
    emit(AuthState.loading(context.tr(LocaleKeys.auth_signing_out)));
    final result = await _authRepo.signOut();
    result.fold((failure) => emit(AuthState.error(failure.errMessage)), (_) {
      emit(const AuthState.unAuthenticated());
      cachedAuthEntity = null;
    });
  }

  /// Delete user account and data
  Future<void> deleteUserAndData({
    required String password,
    required BuildContext context,
  }) async {
    emit(AuthState.loading(context.tr(LocaleKeys.auth_deleting_account)));

    final result = await _authRepo.deleteUserAndData(password: password);

    result.fold((failure) => emit(AuthState.error(failure.errMessage)), (_) {
      emit(const AuthState.unAuthenticated());
      cachedAuthEntity = null;
    });
  }
}
