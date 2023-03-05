import 'package:teammate/domain/entities/game/game.dart';

abstract class SearchGamesRepo {
  Future<List<Game>> getGames();
}
