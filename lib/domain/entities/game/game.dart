import 'package:json_annotation/json_annotation.dart';

import 'package:teammate/domain/entities/game_info/game_info.dart';

part 'game.g.dart';

@JsonSerializable(explicitToJson: true)
class Game {
  const Game({
    required this.gameInfo,
    required this.creatorId,
    required this.id,
    this.playersIds = const [],
  });

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
  Map<String, dynamic> toJson() => _$GameToJson(this);

  final String id;
  final String creatorId;
  final GameInfo gameInfo;
  final List<String> playersIds;
}
