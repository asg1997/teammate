import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:teammate/feachers/game/data/repo/players_repo.dart';
import 'package:teammate/feachers/game/entities/game.dart';
import 'package:teammate/feachers/game/presentation/create_game/presentation/game_info/providers/is_in_provider.dart';

/// Позволяет вступать в игру и выходить из нее
final toggleIsInProvider =
    FutureProvider.autoDispose.family<void, Game>((ref, game) async {
  final playersRepo = ref.watch(playersRepoProvider);

  final isIn = ref.watch(isInProvider(game));
  isIn ? await playersRepo.quitGame(game) : await playersRepo.joinGame(game);
});
