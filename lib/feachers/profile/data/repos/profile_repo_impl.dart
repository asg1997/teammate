import 'package:teammate/feachers/profile/domain/entites/user.dart';
import 'package:teammate/feachers/profile/domain/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  @override
  Future<User> getUserInfo() async {
    return const User(city: 'Тула', nickname: 'guest1234');
  }
}
