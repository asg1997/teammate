import 'package:teammate/feachers/game/domain/entites/game.dart';
import 'package:teammate/feachers/game/domain/repos/games_repo.dart';
import 'package:teammate/feachers/profile/domain/entites/user.dart';

class GamesRepoImpl implements GamesRepo {
  GamesRepoImpl();

  @override
  Future<List<Game>> getAllUserGames() async {
    return [];
  }

  @override
  Future<List<User>> getGamesPlayers(List<String> playersIds) async {
    return [
      const User(city: 'Тула', nickname: 'drobash2011'),
      const User(city: 'Тула', nickname: 'asg1997'),
      const User(city: 'Тула', nickname: 'lina97'),
    ];
  }
}
