import 'package:teammate/domain/entities/city.dart';

abstract class RegistrationRepo {
  Future<bool> get isRegistered;
  Future<bool> isNickAvalible(String nick);
  Future<void> register({required String nick, required City city});
}
