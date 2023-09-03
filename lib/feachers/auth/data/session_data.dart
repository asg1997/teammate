import 'package:teammate/feachers/auth/data/nickname_storage.dart';
import 'package:teammate/feachers/auth/data/user_id.dart';
import 'package:teammate/feachers/players/domain/entities/player.dart';

class SessionData {
  factory SessionData() {
    return _singleton;
  }
  SessionData._();
  static final _singleton = SessionData._();

  late Player currentUser;
  late String _userId;
  String get userId => _userId;

  Future<void> init(
    UniqueUserIdFetcher idInfo,
    NicknameStorage nicknameRepo,
  ) async {
    _userId = await idInfo.currentUserId;

    final nickname = await nicknameRepo.getNickname() ?? '';

    currentUser = Player(nickname: nickname, id: _userId);
  }
}
