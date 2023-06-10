import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationRepo {
  Future<bool> get isNotificationsEnabled async {
    return false;
  }

  Future<void> toggle() async {
    _isOn ? await _turnOff() : await _turnOn();
  }

  bool get _isOn => false;
  Future<void> _turnOn() async {
    final isPermitted = await _checkPermission();
    if (!isPermitted) return;
  }

  Future<void> _turnOff() async {}
  Future<bool> _checkPermission() async {
    final messaging = FirebaseMessaging.instance;
    final settings = await messaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      return true;
    }
    return false;
    // TODO: Подписаться на уведомления
  }
}
