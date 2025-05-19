part of 'sign_in_cubit.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = _Initial;
  const factory SignInState.loading() = _Loading;
  const factory SignInState.success(AuthEntity authEntity) = _Success;
  const factory SignInState.error(String message) = _Error;
  const factory SignInState.emailNotVerified() = _EmailNotVerified;
}
