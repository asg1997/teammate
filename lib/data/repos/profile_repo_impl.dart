import 'package:teammate/domain/entities/user.dart';
import 'package:teammate/domain/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  @override
  Future<User> getUserInfo() async {
    return const User(
      city: 'Тула',
      nickname: 'guest1234',
      phone: '3425435',
      uuid: '2',
    );
  }
}
