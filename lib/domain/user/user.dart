import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();
  const factory User({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String email,
    @Default('') String phone,
    @Default('') String avatar,
  }) = _User;

  factory User.empty() => const User(
        id: 0,
        name: '',
        email: '',
        phone: '',
        avatar: '',
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
