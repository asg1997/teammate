import 'package:teammate/domain/repos/user_id.dart';

class SessionData {
  factory SessionData() {
    return _singleton;
  }
  SessionData._();
  static final _singleton = SessionData._();

  static late UserIdInfo _idInfo;
  static late String _userId;
  String get userId => _userId;

  Future<void> init(UserIdInfo idInfo) async {
    _idInfo = idInfo;
    _userId = await _idInfo.currentUserId;
  }
}
