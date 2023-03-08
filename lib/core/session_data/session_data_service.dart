import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:teammate/core/session_data/session_data.dart';

/// Выбрасывает Exception, когда changeSessionData вызван,
/// но пустой
/// SessionData можно менять только через [saveSessionData]
class SessionDataService {
  static SessionData? get sessionData => _sessionData;
  static SessionData? _sessionData;

  static const _storage = FlutterSecureStorage();

  static bool get isAuth => _sessionData?.id != null;

  static Future<void> init() => _getSessionData();

  static Future<void> saveSessionData(SessionData data) async {
    await _storage.write(
      key: 'sessionData',
      value: jsonEncode(data.toJson()),
    );
    _sessionData = data;
  }

  static Future<void> _getSessionData() async {
    // await removeSessionData();
    final json = await _storage.read(key: 'sessionData');
    if (json == null) return;
    final decoded = jsonDecode(json) as Map<String, dynamic>;
    final data = SessionData.fromJson(decoded);
    _sessionData = data;
  }

  static Future<void> removeSessionData() async {
    await _storage.delete(key: 'sessionData');
    _sessionData = null;
  }
}
