import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/theme/app_decorations.dart';
import 'package:teammate/core/theme/app_fonts.dart';
import 'package:teammate/core/utils/base_state.dart';
import 'package:teammate/core/widgets/app_bar.dart';
import 'package:teammate/core/widgets/main_button.dart';
import 'package:teammate/feachers/cities/presentation/cities_dropdown.dart';
import 'package:teammate/feachers/notifications/presentation/components/notifications_list_view.dart';
import 'package:teammate/feachers/notifications/presentation/components/sport_configs_list_view.dart';
import 'package:teammate/feachers/notifications/presentation/notifiers/save_notifs_notifier.dart';
import 'package:teammate/feachers/notifications/presentation/providers/updated_notif_configs_provider.dart';

class NotificationsPage extends ConsumerWidget {
  const NotificationsPage({super.key});

  void _onSaveTapped(WidgetRef ref) {
    final updatedSettings = ref.watch(updatedNotifConfigsProvider);
    if (updatedSettings == null) return;
    ref.read(saveNotifConfigsProvider.notifier).onSave(updatedSettings);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(saveNotifConfigsProvider, (_, state) {
      state.whenOrNull(
        success: (data) => Navigator.pop(context),
      );
    });
    return Scaffold(
      appBar: const AppBarWidget(text: 'Настройки уведолмений'),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: AppDecorations.defaultPadding
                    .copyWith(top: 20, bottom: 140),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Уведомлять для города',
                      style: AppFonts.semiBold16.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    CitiesDropdown(
                      onCityChanged: (city) {},
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Оповещать о новых играх',
                      style: AppFonts.semiBold16.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    // СПОРТ
                    const SportConfigsListView(),
                    const SizedBox(height: 24),
                    Text(
                      'Типы уведомлений',
                      style: AppFonts.semiBold16.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    // НАСТРОЙКИ УВЕДОМЛЕНИЙ
                    const NotificationsListView(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: AppDecorations.defaultPadding.copyWith(top: 20),
                child: MainButton(
                  title: 'Сохранить',
                  isLoading:
                      ref.watch(saveNotifConfigsProvider) is LoadingBaseState,
                  onTap: () => _onSaveTapped(ref),
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
