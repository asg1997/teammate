import 'package:teammate/domain/entities/city.dart';
import 'package:teammate/domain/entities/user.dart';
import 'package:teammate/domain/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  @override
  Future<User> getUserInfo() async {
    return User(
      city: City(name: '', region: ''),
      nickname: 'guest1234',
      id: '',
    );
  }
}
