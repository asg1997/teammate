import 'package:teammate/feachers/game/entities/game/game.dart';

class GameMapper {
  GameMapper._();

  static Map<String, dynamic> toApi(Game game) => game.toJson();

  static Game fromApi(Map<String, dynamic> json) => Game.fromJson(json);
}
