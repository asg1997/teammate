import 'package:teammate/data/mappers/player_mapper.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/models/sport.dart';

class GameMapper {
  GameMapper._();

  static Map<String, dynamic> toApi(Game game) {
    return {
      'id': game.id,
      'name': game.name,
      'city': game.cityCode,
      'sport': game.sport.name,
      'phone': game.phone,
      'description': game.description,
      'dateTime': game.dateTime.millisecondsSinceEpoch,
      'creatorId': game.creatorId,
      'location': game.location,
      'players': game.players.map(PlayerMapper.toApi).toList(),
    };
  }

  static Game fromApi(Map<String, dynamic> json) {
    return Game(
      id: json['id'] as String,
      name: json['name'] as String,
      cityCode: json['city'] as int,
      sport: Sport.fromJson(json['sport'] as String),
      phone: json['phone'] as String,
      description: json['description'] as String?,
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dateTime'] as int),
      creatorId: json['creatorId'] as String,
      location: json['location'] as String,
      players: (json['players'] as List<dynamic>? ?? []).map((e) {
        e as Map<String, dynamic>;
        return PlayerMapper.fromApi(e);
      }).toList(),
    );
  }
}
