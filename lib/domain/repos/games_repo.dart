import 'package:teammate/domain/entities/game.dart';
import 'package:teammate/domain/entities/user.dart';

abstract class GamesRepo {
  Future<List<Game>> getAllUserGames();
  Future<List<User>> getGamesPlayers(List<String> playersIds);
}
