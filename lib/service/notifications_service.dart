import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationsService {
  factory NotificationsService() => _instance;
  const NotificationsService._();
  static const _instance = NotificationsService._();

  Future<void> init() async {
    await _getPermissionForNotifications();
  }

  Future<String> getDeviceToken() async {
    final messaging = FirebaseMessaging.instance;
    String? deviceToken = await messaging.getToken();
    return deviceToken ?? '';
  }

  Future<void> _getPermissionForNotifications() async {
    await FirebaseMessaging.instance.requestPermission();
  }

  Future<void> subscribeToTopic(String topic) =>
      FirebaseMessaging.instance.subscribeToTopic(topic);

  Future<void> unsubscribeFromTopic(String topic) =>
      FirebaseMessaging.instance.unsubscribeFromTopic(topic);
}
