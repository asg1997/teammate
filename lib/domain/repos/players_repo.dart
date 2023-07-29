// ignore_for_file: one_member_abstracts

import 'package:teammate/models/game.dart';
import 'package:teammate/models/player.dart';

abstract class PlayersRepo {
  Stream<List<Player>> getPlayersForGame(GameId gameId);
  Future<void> joinGame(Game game);
  Future<void> quitGame(Game game);

  Future<void> close();
}
