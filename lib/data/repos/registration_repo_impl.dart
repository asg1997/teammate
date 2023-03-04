import 'package:teammate/domain/repos/registration_repo.dart';

class RegistrationRepoImpl implements RegistrationRepo {
  @override
  Future<void> register({required String nick, required String city}) async {}

  @override
  Future<bool> get isRegistered async => false;
}
