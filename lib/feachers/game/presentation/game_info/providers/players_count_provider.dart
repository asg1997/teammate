import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/game/domain/entities/game.dart';
import 'package:teammate/feachers/game/presentation/game_info/providers/game_teammates_provider.dart';

final playersCountProvider =
    StateProvider.autoDispose.family<int, GameId>((ref, gameId) {
  final players = ref.watch(getPlayersForGameProvider(gameId));
  return players.when(
    data: (value) => value.length,
    error: (_, __) => 0,
    loading: () => 0,
  );
});
