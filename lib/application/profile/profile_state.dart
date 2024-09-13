part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const ProfileState._();
  const factory ProfileState({
    required LoadingStatus status,
    required User user,
    required bool isClicked,
    required bool isFromGallery,
    required String imagePath,
  }) = _ProfileState;

  factory ProfileState.initial() => ProfileState(
        status: const LoadingStatus.initial(),
        user: User.empty(),
        isClicked: false,
        isFromGallery: false,
        imagePath: '',
      );

  bool get hasAvatar => user.avatar.isNotEmpty;
}
