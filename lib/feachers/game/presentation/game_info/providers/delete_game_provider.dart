import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/game/data/repo/games_repo.dart';
import 'package:teammate/feachers/game/presentation/game_info/notifiers/delete_game_notifier/delete_game_notifier.dart';
import 'package:teammate/feachers/game/presentation/game_info/notifiers/delete_game_notifier/state.dart';

final deleteGameNotifierProvider =
    StateNotifierProvider.autoDispose<DeleteGameNotifier, DeleteGameState>(
  (ref) => DeleteGameNotifier(ref.read(gamesRepoProvider)),
);
