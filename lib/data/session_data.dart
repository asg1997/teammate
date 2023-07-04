import 'package:teammate/domain/user_id.dart';

class SessionData {
  factory SessionData() {
    return _singleton;
  }
  static get _singleton => SessionData._();
  SessionData._();

  static UserIdInfo? _idInfo;
  static late String _userId;
  String get userId => _userId;

  Future<void> init(UserIdInfo idInfo) async {
    _idInfo = idInfo;
    _userId = await _idInfo!.currentUserId;
  }
}
