import 'package:teammate/domain/entities/city.dart';
import 'package:teammate/domain/entities/game/game.dart';

abstract class SearchGamesRepo {
  Future<List<Game>> getAllGames({
    required City city,
    bool nextPage = false,
  });
  Future<List<Game>> searchGames({
    required City city,
    required String searchText,
  });
}
