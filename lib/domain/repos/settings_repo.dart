
import 'package:teammate/domain/entities/user.dart';

abstract class SettingsRepo {
  Future<User> getUser();
}
