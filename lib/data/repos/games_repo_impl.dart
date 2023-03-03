import 'package:teammate/domain/entities/game.dart';
import 'package:teammate/domain/entities/sport.dart';
import 'package:teammate/domain/entities/user.dart';
import 'package:teammate/domain/repos/games_repo.dart';

class GamesRepoImpl implements GamesRepo {
  GamesRepoImpl();

  @override
  Future<List<Game>> getAllUserGames() async {
    return [
      Game(
        name: 'name',
        location: 'location',
        dateTime: DateTime.now(),
        sport: Sport.basketball,
        id: '1',
        playersIds: [],
        city: 'Тула',
      )
    ];
  }

  @override
  Future<List<User>> getGamesPlayers(List<String> playersIds) async {
    return [
      const User(
        city: 'Тула',
        nickname: 'drobash2011',
        phone: '12342',
        uuid: '44',
      ),
      const User(city: 'Тула', nickname: 'asg1997', phone: '12342', uuid: '44'),
      const User(city: 'Тула', nickname: 'lina97', phone: '12342', uuid: '44'),
    ];
  }
}
