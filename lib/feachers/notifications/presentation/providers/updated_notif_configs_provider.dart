import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/notifications/domain/notifs_configs/notifs_configs.dart';
import 'package:teammate/feachers/notifications/presentation/providers/updated_notif_types_provider.dart';
import 'package:teammate/feachers/notifications/presentation/providers/updated_sport_configs_provider.dart';

final updatedNotifConfigsProvider = StateProvider.autoDispose<NotifConfigs?>(
  (ref) {
    final sportSettings = ref.watch(updatedSportConfigsProvider);
    final notifTypes = ref.watch(updatedNotifTypesProvider);
    if (sportSettings == null || notifTypes == null) return null;
    return NotifConfigs(
      sportConfigs: sportSettings,
      notifTypes: notifTypes,
    );
  },
);
