part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.started() = _Started;
  const factory ProfileEvent.nameChanged(String value) = _NameChanged;
  const factory ProfileEvent.phoneChanged(String value) = _PhoneChanged;
  const factory ProfileEvent.emailChanged(String value) = _EmailChanged;
  const factory ProfileEvent.avatarChanged(String value) = _AvatarChanged;
  const factory ProfileEvent.addAvatarPressed() = _AddAvatarPressed;
  const factory ProfileEvent.getInfoPressed() = _GetInfoPressed;
}
