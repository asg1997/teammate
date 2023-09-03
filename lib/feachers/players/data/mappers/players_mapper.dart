import 'package:teammate/feachers/players/domain/entities/player.dart';

class PlayerMapper {
  PlayerMapper._();
  static Map<String, dynamic> toApi(Player player) {
    return {
      'nickname': player.nickname,
      'id': player.id,
    };
  }

  static Player fromApi(Map<String, dynamic> json) {
    return Player(
      nickname: json['nickname'] as String,
      id: json['id'] as String,
    );
  }

  static Map<String, dynamic> toLocal(Player player) {
    return {
      'nickname': player.nickname,
      'id': player.id,
    };
  }

  static Player fromLocal(Map<String, dynamic> json) {
    return Player(
      nickname: json['nickname'] as String,
      id: json['id'] as String,
    );
  }
}
