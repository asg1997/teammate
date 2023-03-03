import 'package:teammate/domain/entities/game.dart';

abstract class SearchGamesRepo {
  Future<List<Game>> getGames(SearchGameParams searchParams);
}

class SearchGameParams {
  const SearchGameParams({
    this.city,
    this.title,
  });
  final String? city;
  final String? title;
}
