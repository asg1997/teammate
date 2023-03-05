import 'package:teammate/domain/entities/game/game.dart';
import 'package:teammate/domain/entities/user.dart';
import 'package:teammate/domain/repos/games_repo.dart';

class GamesRepoImpl implements GamesRepo {
  GamesRepoImpl();

  @override
  Future<List<Game>> getAllUserGames() async {
    return [];
  }

  @override
  Future<List<User>> getGamesPlayers(List<String> playersIds) async {
    return [];
  }
}
