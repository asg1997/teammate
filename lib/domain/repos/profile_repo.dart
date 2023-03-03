import 'package:teammate/domain/entities/user.dart';

abstract class ProfileRepo {
  Future<User> getUserInfo();
}
