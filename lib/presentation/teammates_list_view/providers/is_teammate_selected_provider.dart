import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/models/player.dart';

import 'package:teammate/presentation/teammates_list_view/providers/selected_teammates_provider.dart';

final isTeammateSeletedProvider =
    StateProvider.family.autoDispose<bool, Player>((ref, player) {
  final selectedList = ref.watch(selectedTeammatesProvider);
  return selectedList.contains(player);
});
