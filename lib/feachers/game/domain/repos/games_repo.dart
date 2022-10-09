import '../entites/game.dart';

/// [getAllUserGames] - все игры пользователя, участвует или создатель
abstract class GamesRepo {
  Future<List<Game>> getAllUserGames();
}
