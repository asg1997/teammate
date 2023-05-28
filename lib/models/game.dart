import 'package:teammate/models/sport.dart';

class Game {
  Game({
    required this.name,
    required this.city,
    required this.sport,
    required this.phone,
    required this.description,
    required this.dateTime,
  });

  final String name;
  final String city;
  final Sport sport;
  final String phone;
  final String description;
  final DateTime dateTime;
}
