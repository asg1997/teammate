import 'package:teammate/data/session_data.dart';
import 'package:teammate/models/player.dart';
import 'package:teammate/models/sport.dart';

typedef GameId = String;

class Game {
  Game({
    required this.id,
    required this.name,
    required this.cityCode,
    required this.sport,
    required this.phone,
    required this.description,
    required this.dateTime,
    required this.location,
    required this.creatorId,
    this.players = const [],
  });

  final GameId id;
  final String name;
  final int cityCode;
  final Sport sport;
  final String phone;
  final String location;
  final String? description;
  final DateTime dateTime;
  final String creatorId;
  final List<Player> players;

  bool get isMy => SessionData().userId == creatorId;
}
