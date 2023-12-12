import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/notifications/presentation/components/notification_item.dart';
import 'package:teammate/feachers/notifications/presentation/providers/updated_sport_configs_provider.dart';

class SportConfigsListView extends ConsumerWidget {
  const SportConfigsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sportSettings = ref.watch(updatedSportConfigsProvider);
    if (sportSettings == null) return Container();
    return ListView.separated(
      itemCount: sportSettings.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (_, index) {
        final sport = sportSettings.keys.toList()[index];
        final title = sport.locale;

        final value = sportSettings.values.toList()[index];
        return NotificationItem(
          title: title,
          value: value,
          onChanged: (isOn) =>
              ref.read(updatedSportConfigsProvider.notifier).update((state) {
            final updatedState = {...state ?? {}};
            updatedState[sport] = isOn;
            return updatedState;
          }),
        );
      },
    );
  }
}
