part of 'email_sent_cubit.dart';

@freezed
class EmailSentState with _$EmailSentState {
  const factory EmailSentState.initial() = _Initial;
  const factory EmailSentState.inProgress(String message) = _InProgress;
  const factory EmailSentState.error(String message) = _Error;
  const factory EmailSentState.coolDown({required int secondsRemaining}) =
      _CoolDown;
  const factory EmailSentState.emailVerified() = _EmailVerified;
  const factory EmailSentState.emailNotVerified() = _EmailNotVerified;
}
