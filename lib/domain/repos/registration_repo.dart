abstract class RegistrationRepo {
  Future<bool> get isRegistered;

  Future<void> register({
    required String nick,
    required String city,
  });
}
