part of 'change_full_name_cubit.dart';

@freezed
class ChangeFullNameState with _$ChangeFullNameState {
  const factory ChangeFullNameState.initial({@Default(false) bool canSubmit}) =
      _Initial;
  const factory ChangeFullNameState.loading() = _Loading;
  const factory ChangeFullNameState.success() = _Success;
  const factory ChangeFullNameState.error(String message) = _Error;
}
