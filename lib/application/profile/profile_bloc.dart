import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:test_profile/infrastructure/repositories/profile/profile_repository.dart';
import '../../domain/loading_status/loading_status.dart';
import '../../domain/user/user.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;
  final ImagePicker _imagePicker;
  ProfileBloc(this._profileRepository, this._imagePicker) : super(ProfileState.initial()) {
    on<ProfileEvent>(
      (event, emit) => event.map(
        started: (event) => _started(event, emit),
        nameChanged: (event) => _nameChanged(event, emit),
        phoneChanged: (event) => _phoneChanged(event, emit),
        emailChanged: (event) => _emailChanged(event, emit),
        avatarChanged: (event) => _avatarChanged(event, emit),
        addAvatarPressed: (event) => _addAvatarPressed(event, emit),
        getInfoPressed: (event) => _getInfoPressed(event, emit),
      ),
    );
  }

  _started(_Started event, Emitter<ProfileState> emit) async {
    try {
      emit(state.copyWith(status: const LoadingStatus.loading()));
      final user = await _profileRepository.getUserInfo();
      emit(state.copyWith(user: user, status: const LoadingStatus.success()));
    } catch (e) {
      emit(state.copyWith(status: LoadingStatus.failure(e.toString())));
    }
  }

  _nameChanged(_NameChanged event, Emitter<ProfileState> emit) {
    emit(state.copyWith.user(name: event.value));
  }

  _phoneChanged(_PhoneChanged event, Emitter<ProfileState> emit) {
    emit(state.copyWith.user(phone: event.value));
  }

  _emailChanged(_EmailChanged event, Emitter<ProfileState> emit) {
    emit(state.copyWith.user(email: event.value));
  }

  _avatarChanged(_AvatarChanged event, Emitter<ProfileState> emit) {
    emit(state.copyWith.user(avatar: event.value));
    emit(state.copyWith(isFromGallery: false));
  }

  _addAvatarPressed(_AddAvatarPressed event, Emitter<ProfileState> emit) async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(isFromGallery: true, imagePath: image.path));
      emit(state.copyWith.user(avatar: ''));
    }
  }

  _getInfoPressed(_GetInfoPressed event, Emitter<ProfileState> emit) {
    emit(state.copyWith(isClicked: !state.isClicked));
  }
}
