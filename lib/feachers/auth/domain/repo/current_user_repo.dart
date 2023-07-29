abstract class CurrentUserRepo {
  Future<void> saveUser(String nickname);
  Future<String?> getNickname();
}
