import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/auth/domain/entity/auth_entity.dart';

import '../../../domain/repo/auth_repo.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;
  AuthCubit(this._authRepo) : super(AuthState.initial()) {
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

    emit(AuthState.loading(''));
    final result = await _authRepo.getCurrentUser();

    result.fold((failure) => emit(AuthState.error(failure.errMessage)), (
      authEntity,
    ) {
      if (authEntity != null && authEntity.isEmailVerified) {
        emit(AuthState.authenticated(authEntity));
        cachedAuthEntity = authEntity;
      } else {
        emit(AuthState.unAuthenticated());
        cachedAuthEntity = null;
      }
    });
  }

  /// Sign in with google
  Future<void> signInWithGoogle() async {
    emit(AuthState.loading("Signing with Google..."));
    final result = await _authRepo.signInWithGoogle();
    result.fold((failure) => emit(AuthState.error(failure.errMessage)), (
      authEntity,
    ) {
      if (authEntity.isEmailVerified) {
        emit(AuthState.authenticated(authEntity));
        cachedAuthEntity = authEntity;
      } else {
        // Email is not verified
        emit(AuthState.unAuthenticated());
        cachedAuthEntity = null;
      }
    });
  }

  /// Logout
  Future<void> signOut() async {
    emit(AuthState.loading("Signing out..."));
    final result = await _authRepo.signOut();
    result.fold((failure) => emit(AuthState.error(failure.errMessage)), (_) {
      emit(AuthState.unAuthenticated());
      cachedAuthEntity = null;
    });
  }
}
