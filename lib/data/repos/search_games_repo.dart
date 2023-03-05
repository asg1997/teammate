import 'package:teammate/domain/entities/game.dart';

abstract class SearchGamesRepo {
  Future<List<Game>> getGames();
}
