import 'package:teammate/data/repos/search_games_repo.dart';
import 'package:teammate/domain/entities/game/game.dart';

class SearchGamesRepoImpl implements SearchGamesRepo {
  @override
  Future<List<Game>> getGames() async {
    final now = DateTime.now();
    return [];
  }
}
