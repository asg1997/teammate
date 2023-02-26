import 'package:teammate/feachers/profile/domain/entites/user.dart';
import 'package:teammate/feachers/settings/domain/repos/settings_repo.dart';

class SettingsRepoImpl implements SettingsRepo {
  @override
  Future<User> getUser() async {
    return const User(
        city: 'Тула', nickname: 'asg1997', phone: '999999999', uuid: '1');
  }
}
