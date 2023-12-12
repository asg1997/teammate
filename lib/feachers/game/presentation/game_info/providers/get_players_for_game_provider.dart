import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/game/data/players_repo.dart';
import 'package:teammate/feachers/game/entities/game/game.dart';
import 'package:teammate/feachers/players/data/repo/teammates_repo.dart';

final getPlayersForGameProvider =
    StreamProvider.autoDispose.family<Players, GameId>(
  (ref, gameId) {
    final repo = ref.watch(playersRepoProvider);
    ref.onDispose(repo.close);
    return repo.getPlayersForGame(gameId);
  },
);
