import 'package:teammate/domain/entities/user.dart';
import 'package:teammate/domain/repos/settings_repo.dart';

class SettingsRepoImpl implements SettingsRepo {
  @override
  Future<User> getUser() async {
    return const User(
      city: 'Тула',
      nickname: 'asg1997',
      phone: '999999999',
      uuid: '1',
    );
  }
}
