import 'package:teammate/feachers/game/domain/entites/game.dart';
import 'package:teammate/feachers/search_game/domain/repos/search_games_repo.dart';

import '../../../game/domain/entites/game_location.dart';
import '../../../game/domain/entites/sport_.dart';

class SearchGamesRepoImpl implements SearchGamesRepo {
  @override
  Future<List<Game>> getGames(SearchGameParams searchParams) async {
    final now = DateTime.now();
    return [
      Game(
        name: 'Имя игры',
        location: const GameLocation(name: 'к25'),
        dateTime: DateTime(now.year, now.month, now.day + 1),
        sport: Sport.football,
        id: '',
        playersIds: ['aslk3jw21dlas'],
      ),
    ];
  }
}
