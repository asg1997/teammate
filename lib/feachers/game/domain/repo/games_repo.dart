import 'package:teammate/feachers/game/domain/entities/city.dart';
import 'package:teammate/feachers/game/domain/entities/game.dart';

abstract class GamesRepo {
  Future<List<Game>> getGames(City city, {int limit = 10});

  Future<void> createGame(Game game);
  Future<void> delete(Game game);
}
