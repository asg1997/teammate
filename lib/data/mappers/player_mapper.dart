import 'package:teammate/models/user.dart';

class PlayerMapper {
  PlayerMapper._();
  static Player fromApi(Map<String, dynamic> json) {
    return Player(
      nickname: json['nickname'] as String,
      id: json['id'] as String,
    );
  }

  static Map<String, dynamic> toApi(Player player) {
    return {
      'nickname': player.nickname,
      'id': player.id,
    };
  }
}
