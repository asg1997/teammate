import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/game/data/repo/games_repo.dart';
import 'package:teammate/feachers/game/presentation/create_game/models/game_creator_state.dart';
import 'package:teammate/feachers/game/presentation/create_game/notifiers/game_creator_notifier.dart';

final gameCreatorNotifierProvider =
    StateNotifierProvider.autoDispose<GameCreatorNotifier, GameCreatorState>(
  (ref) => GameCreatorNotifier(gamesRepo: ref.read(gamesRepoProvider)),
);
