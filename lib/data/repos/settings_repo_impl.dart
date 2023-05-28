import 'package:teammate/domain/entities/city.dart';
import 'package:teammate/domain/entities/user.dart';
import 'package:teammate/domain/repos/settings_repo.dart';

class SettingsRepoImpl implements SettingsRepo {
  @override
  Future<User> getUser() async {
    return User(
      city: City(name: '', region: ''),
      nickname: 'asg1997',
      id: '',
    );
  }
}
