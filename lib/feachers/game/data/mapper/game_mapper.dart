import 'package:teammate/feachers/game/entities/game.dart';
import 'package:teammate/feachers/game/entities/sport.dart';

class GameMapper {
  GameMapper._();

  static Map<String, dynamic> toApi(Game game) {
    return {
      'id': game.id,
      'city': game.cityCode,
      'sport': game.sport.name,
      'description': game.description,
      'dateTime': game.dateTime.millisecondsSinceEpoch,
      'creatorId': game.creatorId,
      'location': game.location,
      'players': game.players ?? [],
    };
  }

  static Game fromApi(Map<String, dynamic> json) {
    return Game(
      id: json['id'] as GameId,
      cityCode: json['city'] as int,
      sport: Sport.fromJson(json['sport'] as String),
      description: json['description'] as String?,
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dateTime'] as int),
      creatorId: json['creatorId'] as String,
      location: json['location'] as String,
      players: (json['players'] as List<dynamic>? ?? []).map((e) {
        e as String;
        return e;
      }).toList(),
    );
  }
}
