import 'package:teammate/feachers/auth/domain/entities/player.dart';

class PlayerMapper {
  PlayerMapper._();
  static Player fromApi(Map<String, dynamic> json) {
    return Player(
      nickname: json['nickname'] as String,
      id: json['id'] as String,
      teammatesIds: (json['teammatesIds'] as List<dynamic>? ?? [])
          .map((e) => e as String)
          .toList(),
    );
  }

  static Map<String, dynamic> toApi(Player player) {
    return {
      'nickname': player.nickname,
      'id': player.id,
      'teammatesIds': player.teammatesIds.map((e) => e).toList()
    };
  }
}
