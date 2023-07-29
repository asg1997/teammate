
import 'package:teammate/feachers/notifications/domain/entities/notification_settings.dart';

abstract class NotificationsRepo {
  Future<void> changeSettings(NotificationSettings settings);
  Future<NotificationSettings?> getSettings();
}
