import 'package:teammate/feachers/auth/domain/entities/player.dart';
import 'package:teammate/feachers/auth/domain/repo/current_user_repo.dart';
import 'package:teammate/feachers/auth/domain/repo/user_id.dart';

class SessionData {
  factory SessionData() {
    return _singleton;
  }
  SessionData._();
  static final _singleton = SessionData._();

  late Player currentUser;
  late String _userId;
  String get userId => _userId;

  Future<void> init(UserIdInfo idInfo, CurrentUserRepo nicknameRepo) async {
    _userId = await idInfo.currentUserId;

    final nickname = await nicknameRepo.getNickname() ?? '';

    currentUser = Player(nickname: nickname, id: _userId);
  }
}
