import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/notifications/data/mappers/notification_settings_api_mapper.dart';
import 'package:teammate/feachers/notifications/domain/entities/notification_settings.dart';
import 'package:teammate/service/notifications_service.dart';

final notificationRepoProvider =
    Provider<NotificationsRepo>((ref) => NotificationsRepoImpl());

abstract class NotificationsRepo {
  Future<void> changeSettings(NotificationSettings settings);
  Future<NotificationSettings?> getSettings();
}

class NotificationsRepoImpl implements NotificationsRepo {
  final _db = FirebaseFirestore.instance;
  late final _ref = _db.collection('city_subscribers');

  @override
  Future<void> changeSettings(NotificationSettings settings) async {
    try {
      final token = await _getPushToken();
      final json = NotificationSettingsApiMapper.toApi(settings);
      await _ref.doc(token).set(json);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> _getPushToken() => NotificationsService().getDeviceToken();

  @override
  Future<NotificationSettings?> getSettings() async {
    final pushToken = await _getPushToken();

    final snapshot = await _ref.doc(pushToken).get();

    if (!snapshot.exists) return null;
    final data = snapshot.data()!;

    final settings = NotificationSettingsApiMapper.fromApi(data);
    return settings;
  }
}
