import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/notifications/data/notif_configs_fetcher.dart';
import 'package:teammate/feachers/notifications/domain/notifs_configs/notifs_configs.dart';

final notifConfigsProvider = FutureProvider.autoDispose<NotifConfigs>(
  (ref) {
    return ref.read(notifsConfigsFetcherProvider).getSettings();
  },
);
