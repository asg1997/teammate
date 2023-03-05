import 'package:teammate/domain/entities/game/game.dart';
import 'package:teammate/domain/entities/game_info/game_info.dart';

abstract class GameRepo {
  Future<Game> createGame(GameInfo gameInfo);
  Future<void> editGame(GameInfo gameInfo, int id);
}
