import 'package:teammate/feachers/game/domain/entites/sport_.dart';

class Game {
  final String id;
  final String name;
  final String location;
  final String city;
  final DateTime dateTime;
  final Sport sport;
  final List<String>? playersIds;
  const Game({
    required this.city,
    required this.name,
    required this.location,
    required this.dateTime,
    required this.sport,
    required this.id,
    required this.playersIds,
  });
}
