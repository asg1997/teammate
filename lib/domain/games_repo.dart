import 'package:teammate/models/game.dart';

abstract class GamesRepo {
  Future<List<Game>> getGames(String city);

  Future<void> createGame(Game game);
  Future<void> delete(Game game);
}
