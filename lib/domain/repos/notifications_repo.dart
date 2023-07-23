import 'package:teammate/models/notification_settings.dart';

abstract class NotificationsRepo {
  Future<void> changeSettings(NotificationSettings settings);
  Future<NotificationSettings?> getSettings();
}
