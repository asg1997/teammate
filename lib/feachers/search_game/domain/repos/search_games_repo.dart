import '../../../game/domain/entites/game.dart';

abstract class SearchGamesRepo {
  Future<List<Game>> getGames(SearchGameParams searchParams);
}

class SearchGameParams {
  final String? city;
  final String? title;
  const SearchGameParams({
    this.city,
    this.title,
  });
}
