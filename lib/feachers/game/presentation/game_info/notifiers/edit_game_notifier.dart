import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/utils/base_state.dart';
import 'package:teammate/feachers/game/data/game_editor.dart';
import 'package:teammate/feachers/game/data/models/update_game_params.dart';
import 'package:teammate/feachers/game/entities/game/game.dart';

final editGameNotifierProvider =
    StateNotifierProvider.autoDispose<EditGameNotifier, BaseState<Game>>(
  EditGameNotifier.new,
);

class EditGameNotifier extends StateNotifier<BaseState<Game>> {
  EditGameNotifier(this.ref) : super(const BaseState.initial());

  final Ref ref;

  Future<void> editGame({
    required Game game,
    required UpdateGameParams params,
  }) async {
    final hasNoChanges = _hasNoChanges(game: game, params: params);
    if (hasNoChanges) {
      state = BaseState.success(data: game);
      return;
    }
    state = const BaseState.loading();
    try {
      await ref.read(gamesEditorProvider).editGame(game.id, params: params);
      state = BaseState.success(data: game);
    } catch (e) {
      state = const BaseState.initial();
    }
  }

  bool _hasNoChanges({
    required Game game,
    required UpdateGameParams params,
  }) {
    if (params.isEmpty) return true;
    if (game.location == params.location &&
        game.dateTime == params.dateTime &&
        game.name == params.name &&
        game.description == params.description) {
      return true;
    }
    return false;
  }
}
