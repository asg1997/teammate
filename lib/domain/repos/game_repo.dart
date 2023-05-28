import 'package:teammate/domain/entities/game/game.dart';
import 'package:teammate/domain/entities/game_info/game_info.dart';

abstract class GameRepo {
  Future<Game> getGame({required String id});
  Future<Game> createGame(GameInfo gameInfo);
  Future<void> editGame({
    required GameInfo gameInfo,
    required String id,
  });
  Future<void> deleteGame({required String id});
}
