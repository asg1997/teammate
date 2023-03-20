import 'package:teammate/domain/entities/game/game.dart';

abstract class GamesRepo {
  Future<List<Game>> getAllUserGames();
}
