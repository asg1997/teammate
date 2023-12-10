import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/notifications/domain/notifs_configs/notifs_configs.dart';
import 'package:teammate/feachers/notifications/presentation/components/notification_item.dart';
import 'package:teammate/feachers/notifications/presentation/providers/notif_configs_provider.dart';
import 'package:teammate/feachers/notifications/presentation/providers/updated_notif_types_provider.dart';

final notificationTypesProvider =
    StateProvider.autoDispose<NotifTypes>((ref) => {});

class NotificationsListView extends ConsumerWidget {
  const NotificationsListView({super.key});

  String _getLocaleName(NotifTypeId id) {
    switch (id) {
      case 'new_game_created':
        return 'Новая игра в городе';
      case 'teammate_create_game':
        return 'Твой друг создал новую игру';
      case 'player_status_changed':
        return 'Игрок присоединился/вышел из игры';
      case 'game_deleted':
        return 'Игра удалена';
      case 'game_time_changed':
        return 'Время игры изменилось';
      case 'remind_in_two_hours':
        return 'Напомнить за 2 часа игры';
      default:
        return id;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(notifConfigsProvider, (_, state) {
      state.whenData(
        (value) => ref.read(updatedNotifTypesProvider.notifier).state =
            value.notifTypes,
      );
    });
    final notifTypes = ref.watch(updatedNotifTypesProvider);
    if (notifTypes == null) return Container();
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: notifTypes.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (_, index) {
        final typeId = notifTypes.keys.toList()[index];
        final value = notifTypes[typeId] ?? false;
        return NotificationItem(
          title: _getLocaleName(typeId),
          value: value,
          onChanged: (isOn) =>
              ref.read(updatedNotifTypesProvider.notifier).update((state) {
            final updatedState = {...state ?? {}};
            updatedState[typeId] = isOn;
            return updatedState;
          }),
        );
      },
    );
  }
}
