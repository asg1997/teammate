import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationServiceProvider =
    StateProvider<NotificationService>(NotificationService.new);

final notifsGrantedProvider =
    StateProvider<bool>((ref) => ref.watch(fcmTokenProvider) != null);

final fcmTokenProvider = StateProvider<String?>(
  (ref) => ref.watch(notificationServiceProvider).fcmToken,
);

@pragma('vm:entry-point')
Future<void> _handleBackgroundMessage(RemoteMessage message) async {
  print(message.notification?.title);
  print(message.notification?.body);
}

late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

class NotificationService {
  NotificationService(this.ref);
  final Ref ref;

  final _messaging = FirebaseMessaging.instance;

  late AndroidNotificationChannel _channel;
  bool _isFlutterLocalNotificationsInitialized = false;

  Future<void> init() async {
    await _messaging.requestPermission();
    await _initFlutterNotifications();
    await _initLocalNotifications();
    await _initPushNotifications();
    fcmToken = await _messaging.getToken();
    debugPrint(fcmToken);
  }

  String? fcmToken;

  Future<void> _initPushNotifications() async {
    await _messaging.getInitialMessage().then(_handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen(_showNotification);
  }

  void _handleMessage(RemoteMessage? message) {
    if (message == null) return;
    print(message.notification?.title);
  }

  Future<void> _initFlutterNotifications() async {
    if (_isFlutterLocalNotificationsInitialized) {
      return;
    }
    _channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    _isFlutterLocalNotificationsInitialized = true;
  }

  void _showNotification(RemoteMessage message) {
    final notification = message.notification;
    final android = message.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      _flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        payload: jsonEncode(message.toMap()),
        NotificationDetails(
          android: AndroidNotificationDetails(
            _channel.id,
            _channel.name,
            channelDescription: _channel.description,
            // TODO: add icon for android
            icon: 'launch_background',
          ),
        ),
      );
    }
  }

  Future<void> _initLocalNotifications() async {
    const initSettings = InitializationSettings(
      iOS: DarwinInitializationSettings(),
      // TODO add icon for android
      android: AndroidInitializationSettings('logo'),
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        print('notificationResponse ${notificationResponse.payload}');
      },
    );
  }
}
