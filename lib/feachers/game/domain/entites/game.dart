import 'package:teammate/feachers/game/domain/entites/game_location.dart';
import 'package:teammate/feachers/game/domain/entites/sport_.dart';

class Game {
  final String id;
  final String name;
  final GameLocation location;
  final DateTime dateTime;
  final Sport sport;
  final List<String>? playersIds;
  const Game({
    required this.name,
    required this.location,
    required this.dateTime,
    required this.sport,
    required this.id,
    required this.playersIds,
  });
}
