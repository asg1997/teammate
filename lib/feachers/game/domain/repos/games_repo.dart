import '../../../profile/domain/entites/user.dart';
import '../entites/game.dart';

/// [getAllUserGames] - все игры пользователя, участвует или создатель
abstract class GamesRepo {
  Future<List<Game>> getAllUserGames();
  Future<List<User>> getGamesPlayers(List<String> playersIds);
}
