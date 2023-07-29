import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/models/player.dart';

import 'package:teammate/presentation/teammates_list_view/notifiers/selected_teammates_notifier.dart';

final selectedTeammatesProvider =
    StateNotifierProvider.autoDispose<SelectedTeammatesNotifier, List<Player>>(
  (ref) => SelectedTeammatesNotifier(),
);
