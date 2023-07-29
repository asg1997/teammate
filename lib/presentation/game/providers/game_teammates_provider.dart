import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/models/player.dart';
import 'package:teammate/presentation/game/providers/players_provider.dart';

final getPlayersForGameProvider =
    StreamProvider.autoDispose.family<List<Player>, GameId>(
  (ref, gameId) {
    final repo = ref.watch(playersRepoProvider);
    ref.onDispose(repo.close);
    return repo.getPlayersForGame(gameId);
  },
);
