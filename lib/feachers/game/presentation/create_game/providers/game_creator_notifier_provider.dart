import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/game/presentation/create_game/models/game_creator_state.dart';
import 'package:teammate/feachers/game/presentation/create_game/notifiers/game_creator_notifier.dart';

final gameCreatorNotifierProvider =
    StateNotifierProvider.autoDispose<GameCreatorNotifier, GameCreatorState>(
  GameCreatorNotifier.new,
);
