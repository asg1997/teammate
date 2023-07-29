import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/auth/domain/entities/player.dart';
import 'package:teammate/feachers/game/domain/entities/game.dart';
import 'package:teammate/feachers/game/presentation/game_info/providers/players_provider.dart';

final getPlayersForGameProvider =
    StreamProvider.autoDispose.family<List<Player>, GameId>(
  (ref, gameId) {
    final repo = ref.watch(playersRepoProvider);
    ref.onDispose(repo.close);
    return repo.getPlayersForGame(gameId);
  },
);
