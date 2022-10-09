import 'package:teammate/feachers/game/domain/entites/game_location.dart';
import 'package:teammate/feachers/game/domain/entites/sport_.dart';

class Game {
  final String name;
  final GameLocation location;
  final DateTime dateTime;
  final Sport sport;
  const Game({
    required this.name,
    required this.location,
    required this.dateTime,
    required this.sport,
  });
}
