import 'package:teammate/models/player.dart';

class TeammatesMapper {
  TeammatesMapper._();
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
}
