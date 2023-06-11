import 'package:teammate/data/user_id_creator.dart';

class SessionData {
  factory SessionData() => _singleton;
  static get _singleton => SessionData._();
  SessionData._();

  static late String _userId;
  String get userId => _userId;

  Future<void> init() async {
    final userId = await UserIdCreator.deviceId;
    if (userId == null) throw Exception();
    _userId = userId;
  }
}
