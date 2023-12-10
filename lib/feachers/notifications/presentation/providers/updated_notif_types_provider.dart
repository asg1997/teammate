import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/notifications/domain/notifs_configs/notifs_configs.dart';

final updatedNotifTypesProvider = StateProvider.autoDispose<NotifTypes?>(
  (ref) => null,
);
