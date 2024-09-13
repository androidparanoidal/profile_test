import 'package:injectable/injectable.dart';
import '../../../domain/user/user.dart';
import 'fake_user_data.dart';

@injectable
class ProfileRepository {
  ProfileRepository();

  Future<User> getUserInfo() async {
    await Future.delayed(const Duration(seconds: 2));
    final user = User.fromJson(fakeUserData);
    return user;
  }
}
