import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/dependency_injection.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/presentation/game/game_page_model.dart';

final gamePageProvider =
    ChangeNotifierProvider.autoDispose.family<GamePageModel, Game>((ref, game) {
  return GamePageModel(
    game: game,
    gamesRepo: sl(),
    playersRepo: sl(),
  );
});
