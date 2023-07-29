import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/models/player.dart';

class SelectedTeammatesNotifier extends StateNotifier<List<Player>> {
  SelectedTeammatesNotifier() : super([]);

  void _addPlayer(Player player) {
    state = [...state, player];
  }

  bool _inList(Player player) => state.contains(player);

  void _removePlayer(Player player) {
    state = state.where((p) => p != player).toList();
  }

  void toggle(Player player) =>
      _inList(player) ? _removePlayer(player) : _addPlayer(player);
}
