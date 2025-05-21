part of 'edit_profile_cubit.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState.initial({
    @Default(false) bool canSubmit,
    AuthEntity? authEntity,
  }) = _Initial;

  const factory EditProfileState.loading() = _Loading;
  const factory EditProfileState.success(AuthEntity authEntity) = _Success;
  const factory EditProfileState.error(String message) = _Error;
}
