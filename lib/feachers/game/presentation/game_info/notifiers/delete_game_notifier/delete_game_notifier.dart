import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/game/data/repo/games_repo.dart';
import 'package:teammate/feachers/game/entities/game.dart';
import 'package:teammate/feachers/game/presentation/game_info/notifiers/delete_game_notifier/state.dart';

class DeleteGameNotifier extends StateNotifier<DeleteGameState> {
  DeleteGameNotifier(this.gamesRepo) : super(const DeleteGameState.initial());
  final GamesRepo gamesRepo;
  Future<void> deleteGame(Game game) async {
    const DeleteGameState.deleting();
    try {
      await gamesRepo.delete(game);
      const DeleteGameState.success();
    } catch (e) {
      const DeleteGameState.initial();
    }
  }
}
