import 'package:teammate/feachers/players/domain/entities/player.dart';

class SessionData {
  factory SessionData.initialize({
    required String nickname,
    required String userId,
  }) {
    _currentUser = Player(nickname: nickname, id: userId);
    return _singleton;
  }
  SessionData._();
  static final _singleton = SessionData._();

  static late Player _currentUser;
  static Player get currentUser => _currentUser;

  static String get userId => _currentUser.id;
  static String get nickname => _currentUser.nickname;
}
