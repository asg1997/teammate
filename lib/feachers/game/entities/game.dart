import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teammate/feachers/auth/data/session_data.dart';
import 'package:teammate/feachers/game/entities/sport.dart';

import 'package:teammate/feachers/players/domain/entities/player.dart';
part 'game.freezed.dart';

typedef GameId = String;
typedef Games = List<Game>;

@freezed
class Game with _$Game {
  const factory Game({
    required GameId id,
    required String creatorId,
    required String name,
    required int cityCode,
    required Sport sport,
    required String location,
    required String? description,
    required DateTime dateTime,
    List<PlayerId>? players,
  }) = _Game;
  const Game._();

  static GameId generateDateBasedId(DateTime date) =>
      date.millisecondsSinceEpoch.toString();
  bool get isMy => SessionData().userId == creatorId;
}
