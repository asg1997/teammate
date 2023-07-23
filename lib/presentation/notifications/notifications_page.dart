import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/dependency_injection.dart';
import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/theme/app_decorations.dart';
import 'package:teammate/core/theme/app_fonts.dart';
import 'package:teammate/core/widgets/app_bar.dart';
import 'package:teammate/core/widgets/main_button.dart';
import 'package:teammate/presentation/notifications/notifications_page_model.dart';

import '../../models/sport.dart';
import '../../core/widgets/cities_dropdown.dart';

final notificationsPageProvider = ChangeNotifierProvider.autoDispose(
    (ref) => NotificationsPageModel(notificationsRepo: sl(), cityRepo: sl()));

class NotificationsPage extends ConsumerWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.read(notificationsPageProvider);
    final sportSettings = ref.watch(notificationsPageProvider).sportSettings;
    final selectedCity = ref.watch(notificationsPageProvider).selectedCity;
    return Scaffold(
      appBar: const AppBarWidget(text: 'Настройки уведолмений'),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: AppDecorations.defaultPadding.copyWith(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Оповещать о новых играх',
                style: AppFonts.semiBold16.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 16),
              ...Sport.values
                  .map(
                    (e) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _NotificationItem(
                          title: e.locale,
                          value: sportSettings[e]!,
                          onChanged: (isOn) =>
                              model.onSportNotificationsChanged(e, isOn),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  )
                  .toList(),
              const SizedBox(height: 18),
              Text(
                'Город',
                style: AppFonts.semiBold16.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 16),
              CitiesDropdown(
                onCityChanged: model.onCityChanged,
                initialCity: selectedCity,
              ),
              const Spacer(),
              MainButton(
                title: 'Сохранить',
                onTap: model.onSave,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationItem extends ConsumerWidget {
  const _NotificationItem({
    required this.title,
    required this.value,
    required this.onChanged,
  });
  final String title;
  final bool value;
  final void Function(bool value) onChanged;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15)
          .copyWith(right: 10),
      decoration: BoxDecoration(
        borderRadius: AppDecorations.defaultBorderRadius,
        color: const Color.fromARGB(255, 56, 56, 56),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppFonts.regular15.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 10,
            child: CupertinoSwitch(
              value: value,
              onChanged: onChanged,
            ),
          )
        ],
      ),
    );
  }
}