import '../entites/user.dart';

abstract class ProfileRepo {
  Future<User> getUserInfo();
}
