import 'package:teammate/feachers/auth/data/repo/session_data.dart';
import 'package:teammate/feachers/auth/domain/entities/player.dart';
import 'package:teammate/feachers/game/domain/entities/sport.dart';

typedef GameId = String;

class Game {
  Game({
    required this.id,
    required this.name,
    required this.cityCode,
    required this.sport,
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
  final String location;
  final String? description;
  final DateTime dateTime;
  final String creatorId;
  final List<Player> players;

  bool get isMy => SessionData().userId == creatorId;
}
