import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> onBackgroundMessage(RemoteMessage message) async {}

class NotificationsService {
  factory NotificationsService() => _instance;
  const NotificationsService._();
  static const _instance = NotificationsService._();

  Future<void> init() async {
    await _getPermissionForNotifications();

    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    FirebaseMessaging.onMessage.listen(_showMessage);
    await _initLocalNotifications();
  }

// ios: fd1cpBuIE0pYlq6P0L352x:APA91bHNpddstvWTIWgiFBKCGCTPJA0xt0817h6Yj2sG9AA00IaeJ2i-FiEAuoGyX0rhnqgUzjG6FyQB_VajrivTiuOYxAMpzwyq-sv06bFEYPfx0oz1jmbuExBi7E-W0PsyIubInq9W
// Android dXualxhHTfmIywSm3DcER1:APA91bHAOvpG9Tv9RlE6QZZayGXoYgakdGa5me65bbVucPrraQgt-YsOxlII3H3HHziUN-MfffJLAh4MAeA1NCOTao1uecmS3btomgRnD00cCl_JNE7MYO9w22pMQXtgwTT7dqdJimyr
  Future<String> getDeviceToken() async {
    final messaging = FirebaseMessaging.instance;
    final deviceToken = await messaging.getToken();
    return deviceToken ?? '';
  }

  Future<void> _getPermissionForNotifications() =>
      FirebaseMessaging.instance.requestPermission();

  Future<void> onMessage(RemoteMessage message) => _showMessage(message);

  Future<void> _showMessage(RemoteMessage message) async {
    final title = message.notification?.title ?? '';
    final body = message.notification?.body ?? '';
    final id = message.notification.hashCode;
    await FlutterLocalNotificationsPlugin().show(
      id,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          importance: Importance.high,
        ),
      ),
    );
  }

  Future<void> _initLocalNotifications() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/teammate_logo');
    const initializationSettingsIOS = DarwinInitializationSettings();
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await FlutterLocalNotificationsPlugin().initialize(initializationSettings);
  }

  Future<void> subscribeToTopic(String topic) =>
      FirebaseMessaging.instance.subscribeToTopic(topic);

  Future<void> unsubscribeFromTopic(String topic) =>
      FirebaseMessaging.instance.unsubscribeFromTopic(topic);
}
