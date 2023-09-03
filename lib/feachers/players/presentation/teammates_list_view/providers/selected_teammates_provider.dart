import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/players/domain/entities/player.dart';

import 'package:teammate/feachers/players/presentation/teammates_list_view/notifiers/selected_teammates_notifier.dart';

final selectedTeammatesProvider =
    StateNotifierProvider.autoDispose<SelectedTeammatesNotifier, List<Player>>(
  (ref) => SelectedTeammatesNotifier(),
);
