import 'package:firebase_messaging/firebase_messaging.dart';

// fnoGxZYCnUM5vkFhgf71ig:APA91bEY1TFWx4-dKPc2SQ5Wt15EWAcftMDQ88rYcIM0lTDJdZosRESyaHvoU4GKd4u-ClvXKHTFB1CtTPuvAUZal9B0pE62Xbd6bc2Kvj4LyC3XaWhq_5pAErc-x2ztYMfy-g6YJcEE

class NotificationsService {
  factory NotificationsService() => _instance;
  const NotificationsService._();
  static const _instance = NotificationsService._();

  Future<void> init() async {
    await _getPermissionForNotifications();
    final token = await _getDeviceToken();
    print(token);
  }

  Future<String> _getDeviceToken() async {
    final messaging = FirebaseMessaging.instance;
    String? deviceToken = await messaging.getToken();
    return deviceToken ?? '';
  }

  Future<void> _getPermissionForNotifications() =>
      FirebaseMessaging.instance.requestPermission();

  void _listenApp() async {
    // TODO:
  }

  Future<void> subscribeToTopic(String topic) =>
      FirebaseMessaging.instance.subscribeToTopic(topic);

  Future<void> unsubscribeFromTopic(String topic) =>
      FirebaseMessaging.instance.unsubscribeFromTopic(topic);
}
