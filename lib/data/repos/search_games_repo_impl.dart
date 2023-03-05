import 'package:teammate/data/repos/search_games_repo.dart';
import 'package:teammate/domain/entities/game.dart';
import 'package:teammate/domain/entities/sport.dart';

class SearchGamesRepoImpl implements SearchGamesRepo {
  @override
  Future<List<Game>> getGames() async {
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
