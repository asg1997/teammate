import '../../../profile/domain/entites/user.dart';

abstract class SettingsRepo {
  Future<User> getUser();
}
