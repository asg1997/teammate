import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/utils/base_state.dart';
import 'package:teammate/feachers/game/data/game_editor.dart';
import 'package:teammate/feachers/game/entities/game/game.dart';

final deleteGameNotifierProvider =
    StateNotifierProvider.autoDispose<DeleteGameNotifier, BaseState<Game>>(
  DeleteGameNotifier.new,
);

class DeleteGameNotifier extends StateNotifier<BaseState<Game>> {
  DeleteGameNotifier(this.ref) : super(const BaseState.initial());

  final Ref ref;

  Future<void> deleteGame(Game game) async {
    state = const BaseState.loading();
    try {
      await ref.read(gamesEditorProvider).deleteGame(game.id);
      state = BaseState.success(data: game);
    } catch (e) {
      state = const BaseState.initial();
    }
  }
}
