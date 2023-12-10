// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/exceptions/custom_exception.dart';
import 'package:teammate/core/utils/base_state.dart';
import 'package:teammate/feachers/notifications/data/notif_configs_updater.dart';
import 'package:teammate/feachers/notifications/domain/notifs_configs/notifs_configs.dart';

final saveNotifConfigsProvider =
    StateNotifierProvider.autoDispose<SaveNotifConfigNotifier, BaseState<void>>(
  SaveNotifConfigNotifier.new,
);

class SaveNotifConfigNotifier extends StateNotifier<BaseState<void>> {
  SaveNotifConfigNotifier(this.ref) : super(const BaseState.initial());

  final Ref ref;

  Future<void> onSave(NotifConfigs settings) async {
    state = const BaseState.loading();
    try {
      await ref.read(notifConfigsUpdaterProvider).updateSettings(settings);
      state = const BaseState.success();
    } on CustomException catch (e) {
      state = BaseState.error(e);
    }
  }
}
