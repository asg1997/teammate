import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/consts/firebase_consts.dart';
import 'package:teammate/feachers/game/entities/sport.dart';
import 'package:teammate/feachers/notifications/data/all_notifications_types.dart';
import 'package:teammate/feachers/notifications/data/mappers/notification_settings_api_mapper.dart';
import 'package:teammate/feachers/notifications/domain/notification_service.dart';
import 'package:teammate/feachers/notifications/domain/notifs_configs/notifs_configs.dart';

final notifsConfigsFetcherProvider = Provider<NotifsConfigsFetcher>(
  NotificationsSettingsFetcherImpl.new,
);

abstract class NotifsConfigsFetcher {
  Future<NotifConfigs> getSettings();
}

class NotificationsSettingsFetcherImpl implements NotifsConfigsFetcher {
  NotificationsSettingsFetcherImpl(this.ref);
  final Ref ref;
  final _db = FirebaseFirestore.instance;
  late final _ref = _db.collection(FirebaseCollections.players);

  @override
  Future<NotifConfigs> getSettings() async {
    try {
      final pushToken = ref.read(fcmTokenProvider);

      final snapshot = await _ref.doc(pushToken).get();

      if (!snapshot.exists) return _defaultSettings;
      final data = snapshot.data()!;
      final notifsSettings =
          data[FirebaseFields.notificationSettings] as Map<String, dynamic>?;

      if (notifsSettings == null) return _defaultSettings;

      final fetchedSettings = NotifConfigsApiMapper.fromApi(notifsSettings);
      final mergedSettings = _mergeWithDefaultSettings(fetchedSettings);
      return mergedSettings;
    } catch (e) {
      return _defaultSettings;
    }
  }

  NotifConfigs _mergeWithDefaultSettings(NotifConfigs fetched) {
    final mergedSportSettings = {
      ..._defaultSportSettings,
      ...fetched.sportConfigs,
    };
    final mergedTypeSettings = {
      ..._defaultTypeSettings,
      ...fetched.notifTypes,
    };
    return fetched.copyWith(
      sportConfigs: mergedSportSettings,
      notifTypes: mergedTypeSettings,
    );
  }

  NotifConfigs get _defaultSettings => NotifConfigs(
        sportConfigs: _defaultSportSettings,
        notifTypes: _defaultTypeSettings,
      );

  final Map<Sport, bool> _defaultSportSettings = {
    for (final sport in Sport.values) sport: true,
  };
  final NotifTypes _defaultTypeSettings = {
    for (final type in allNotificationsTypes) type: true,
  };
}
