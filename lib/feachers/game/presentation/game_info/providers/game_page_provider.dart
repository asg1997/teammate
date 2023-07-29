import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/dependency_injection.dart';
import 'package:teammate/feachers/game/domain/entities/game.dart';
import 'package:teammate/feachers/game/presentation/game_info/game_page_model.dart';

final gamePageProvider =
    ChangeNotifierProvider.autoDispose.family<GamePageModel, Game>((ref, game) {
  return GamePageModel(
    game: game,
    gamesRepo: sl(),
    playersRepo: sl(),
  );
});
