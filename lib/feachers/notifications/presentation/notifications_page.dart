import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/exceptions/custom_exception.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/core/theme/app_colors.dart';
import 'package:teammate/core/theme/app_decorations.dart';
import 'package:teammate/core/theme/app_fonts.dart';
import 'package:teammate/core/utils/base_state.dart';
import 'package:teammate/core/widgets/app_bar.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/core/widgets/main_button.dart';
import 'package:teammate/feachers/cities/presentation/cities_dropdown.dart';
import 'package:teammate/feachers/notifications/domain/notification_service.dart';
import 'package:teammate/feachers/notifications/presentation/components/notifications_list_view.dart';
import 'package:teammate/feachers/notifications/presentation/components/sport_configs_list_view.dart';
import 'package:teammate/feachers/notifications/presentation/notifiers/save_notifs_notifier.dart';
import 'package:teammate/feachers/notifications/presentation/providers/notif_configs_provider.dart';
import 'package:teammate/feachers/notifications/presentation/providers/updated_notif_configs_provider.dart';
import 'package:teammate/feachers/notifications/presentation/providers/updated_notif_types_provider.dart';
import 'package:teammate/feachers/notifications/presentation/providers/updated_sport_configs_provider.dart';

class NotificationsPage extends ConsumerStatefulWidget {
  const NotificationsPage({super.key});

  static void push() => navigatorKey.currentState?.push(
        MaterialPageRoute<void>(
          builder: (_) => const NotificationsPage(),
        ),
      );

  @override
  ConsumerState<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends ConsumerState<NotificationsPage> {
  void _onSaveTapped(WidgetRef ref) {
    final updatedSettings = ref.watch(updatedNotifConfigsProvider);
    if (updatedSettings == null) return;
    ref.read(saveNotifConfigsProvider.notifier).onSave(updatedSettings);
  }

  @override
  void dispose() {
    // приходится автоматически закрывать провайдеры,
    // потому что иначе они диспозятся раньше времени
    ref
      ..invalidate(updatedSportConfigsProvider)
      ..invalidate(updatedNotifTypesProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref
      ..listen(saveNotifConfigsProvider, (_, state) {
        state.whenOrNull(
          success: (data) => Navigator.pop(context),
        );
      })
      ..listen(notifConfigsProvider, (_, state) {
        state.whenData(
          (value) => ref.read(updatedSportConfigsProvider.notifier).state =
              value.sportConfigs,
        );
      })
      ..listen(notifConfigsProvider, (_, state) {
        state.whenOrNull(
          data: (value) => ref.read(updatedNotifTypesProvider.notifier).state =
              value.notifTypes,
        );
      });
    final notifsGranted = ref.watch(notifsGrantedProvider);

    return Scaffold(
      appBar: const AppBarWidget(text: 'Настройки уведолмений'),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: notifsGranted
            ? ref.watch(notifConfigsProvider).when(
                  data: (data) => Stack(
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
                                style: AppFonts.semiBold16
                                    .copyWith(color: Colors.white),
                              ),
                              const SizedBox(height: 16),
                              CitiesDropdown(
                                onCityChanged: (city) {
                                  // TODO:?
                                },
                              ),
                              const SizedBox(height: 24),
                              Text(
                                'Оповещать о новых играх',
                                style: AppFonts.semiBold16
                                    .copyWith(color: Colors.white),
                              ),
                              const SizedBox(height: 16),
                              // СПОРТ
                              const SportConfigsListView(),
                              const SizedBox(height: 24),
                              Text(
                                'Типы уведомлений',
                                style: AppFonts.semiBold16
                                    .copyWith(color: Colors.white),
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
                          padding:
                              AppDecorations.defaultPadding.copyWith(top: 20),
                          child: MainButton(
                            title: 'Сохранить',
                            isLoading: ref.watch(saveNotifConfigsProvider)
                                is LoadingBaseState,
                            onTap: () => _onSaveTapped(ref),
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ],
                  ),
                  error: (e, __) =>
                      Center(child: Text((e as CustomException).toString())),
                  loading: LoadingWidget.new,
                )
            : Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Включите уведомления \nв настройках',
                      style: AppFonts.semiBold16,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const _GoToSettingsButton(),
                  ],
                ),
              ),
      ),
    );
  }
}

class _GoToSettingsButton extends StatelessWidget {
  const _GoToSettingsButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () =>
            AppSettings.openAppSettings(type: AppSettingsType.notification),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.main,
          textStyle: const TextStyle(fontSize: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          'Перейти в настройки',
          style: AppFonts.button,
        ),
      ),
    );
  }
}
