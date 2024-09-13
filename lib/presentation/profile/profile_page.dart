import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_profile/presentation/widgets/loading_status.dart';
import 'package:test_profile/shared/extensions.dart';
import '../../application/profile/profile_bloc.dart';
import '../widgets/phone_text_from_field.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (p, c) => p.status != c.status,
      builder: (context, state) {
        return LoadingWidget(
          status: state.status,
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Профиль'),
                elevation: 0,
                backgroundColor: Colors.blueAccent,
              ),
              body: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ProfilePageBody(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const AvatarSection(),
          InfoTextField(
            initialValue: context.currentUser.name,
            label: 'Имя пользователя',
            maxLength: 50,
            keyboardType: TextInputType.name,
            onChanged: (value) {
              context.read<ProfileBloc>().add(ProfileEvent.nameChanged(value));
            },
          ),
          context.currentUser.phone.length == 18
              ? Text('Текущий валидный телефон:\n${context.currentUser.phone}', textAlign: TextAlign.start)
              : const Text('Телефон введен неверно', style: TextStyle(color: Colors.red)),
          PhoneTextFromField(
            initialValue: context.currentUser.phone,
            label: 'Телефон',
            onChanged: (value) {
              context.read<ProfileBloc>().add(ProfileEvent.phoneChanged(value));
            },
          ),
          InfoTextField(
            initialValue: context.currentUser.email,
            label: 'E-mail',
            maxLength: 50,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              context.read<ProfileBloc>().add(ProfileEvent.emailChanged(value));
            },
          ),
          const ShowUpdatedInfoButton(),
        ],
      ),
    );
  }
}

class AvatarSection extends StatelessWidget {
  const AvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (p, c) => p.user.avatar != c.user.avatar,
      builder: (context, state) {
        return Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                ClipOval(
                  child: state.hasAvatar
                      ? Image.asset(state.user.avatar, height: 100, width: 100, fit: BoxFit.fitHeight)
                      : state.isFromGallery
                          ? Image(
                              height: 100, width: 100, fit: BoxFit.fitHeight, image: FileImage(File(state.imagePath)))
                          : const EmptyAvatarWidget(),
                ),
                Positioned(
                  bottom: 0,
                  right: -8,
                  child: GestureDetector(
                    onTap: () {
                      context.read<ProfileBloc>().add(const ProfileEvent.addAvatarPressed());
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                      child: const Icon(Icons.add, color: Colors.white, size: 25),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Загрузите аватар \nили выберите из предложенных ниже',
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: () => context.read<ProfileBloc>().add(const ProfileEvent.avatarChanged('')),
                    child: const Icon(Icons.no_accounts, color: Colors.grey, size: 30),
                  ),
                ),
                const AvatarTile(image: 'assets/avatars/1.PNG'),
                const AvatarTile(image: 'assets/avatars/2.PNG'),
                const AvatarTile(image: 'assets/avatars/3.PNG'),
              ],
            ),
          ],
        );
      },
    );
  }
}

class EmptyAvatarWidget extends StatelessWidget {
  const EmptyAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: Colors.blueAccent,
      child: Icon(Icons.not_interested, size: 50, color: Colors.white),
    );
  }
}

class AvatarTile extends StatelessWidget {
  final String image;
  const AvatarTile({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {
          context.read<ProfileBloc>().add(ProfileEvent.avatarChanged(image));
        },
        child: ClipOval(
          child: Image.asset(
            image,
            fit: BoxFit.fitHeight,
            width: 30,
            height: 30,
          ),
        ),
      ),
    );
  }
}

class InfoTextField extends StatelessWidget {
  final String initialValue;
  final String label;
  final int? maxLength;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;

  const InfoTextField({
    super.key,
    required this.initialValue,
    required this.label,
    this.onChanged,
    this.maxLength,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        autocorrect: false,
        initialValue: initialValue,
        maxLength: maxLength,
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: const InputDecoration(
          counterText: '',
        ),
      ),
    );
  }
}

class ShowUpdatedInfoButton extends StatelessWidget {
  const ShowUpdatedInfoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  context.read<ProfileBloc>().add(const ProfileEvent.getInfoPressed());
                  // Здесь можно отправить запрос на сервер с обновленными данными
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                ),
                child: Text(state.isClicked ? 'Скрыть обновленную информацию' : 'Показывать обновленную информацию',
                    textAlign: TextAlign.center),
              ),
              const SizedBox(height: 10),
              if (state.isClicked)
                Text('${state.user.name}\n${state.user.phone}\n${state.user.email}\n${state.user.avatar}\n')
            ],
          ),
        );
      },
    );
  }
}
