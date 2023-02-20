import 'package:teammate/feachers/game/domain/entites/game.dart';
import 'package:teammate/feachers/search_game/domain/repos/search_games_repo.dart';

import '../../../game/domain/entites/sport_.dart';

class SearchGamesRepoImpl implements SearchGamesRepo {
  @override
  Future<List<Game>> getGames(SearchGameParams searchParams) async {
    final now = DateTime.now();
    return [
      Game(
        name: 'Мясорубка',
        location: 'k25',
        dateTime: DateTime(now.year, now.month, now.day + 1),
        sport: Sport.football,
        id: '',
        city: 'Тула',
        playersIds: ['aslk3jw21dlas'],
      ),
      Game(
        name: 'Заруба',
        location: 'k25',
        dateTime: DateTime(now.year, now.month, now.day + 1),
        sport: Sport.football,
        id: '',
        city: 'Тула',
        playersIds: ['aslk3jw21dlas'],
      ),
      Game(
        name: 'Поселковчани',
        location: 'k25',
        dateTime: DateTime(now.year, now.month, now.day + 1),
        sport: Sport.football,
        id: '',
        playersIds: ['aslk3jw21dlas'],
        city: 'Тула',
      ),
    ];
  }
}
