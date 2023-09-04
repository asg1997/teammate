import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:teammate/feachers/launch/notifiers/app_config_notifier.dart';
import 'package:teammate/feachers/launch/notifiers/app_config_state.dart';

final appConfigProvider =
    StateNotifierProvider<AppConfigNotifier, AppConfigState>(
  AppConfigNotifier.new,
);
