// ignore_for_file: one_member_abstracts

import 'package:teammate/feachers/auth/domain/entities/player.dart';
import 'package:teammate/feachers/game/domain/entities/game.dart';

abstract class PlayersRepo {
  Stream<List<Player>> getPlayersForGame(GameId gameId);
  Future<void> joinGame(Game game);
  Future<void> quitGame(Game game);

  Future<void> close();
}
