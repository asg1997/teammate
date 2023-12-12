import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teammate/core/consts/firebase_consts.dart';
import 'package:teammate/feachers/auth/data/session_data.dart';
import 'package:teammate/feachers/game/entities/sport.dart';
import 'package:teammate/feachers/players/domain/entities/player.dart';

part 'game.freezed.dart';
part 'game.g.dart';

typedef GameId = String;
typedef Games = List<Game>;

@freezed
class Game with _$Game {
  const factory Game({
    required GameId id,
    required String creatorId,
    required String name,
    @JsonKey(name: FirebaseFields.city) required int cityCode,
    @SportJsonConverter() required Sport sport,
    required String location,
    required String? description,
    @TimeStampJsonConverter() required DateTime dateTime,
    List<PlayerId>? players,
  }) = _Game;

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
  const Game._();

  static GameId generateDateBasedId(DateTime date) =>
      date.millisecondsSinceEpoch.toString();
  bool get isMy => SessionData.userId == creatorId;
  bool get isNotMy => !isMy;
}

class SportJsonConverter extends JsonConverter<Sport, String> {
  const SportJsonConverter();
  @override
  Sport fromJson(String json) => Sport.fromJson(json);

  @override
  String toJson(Sport object) => object.toJson();
}

class TimeStampJsonConverter extends JsonConverter<DateTime, Timestamp> {
  const TimeStampJsonConverter();
  @override
  DateTime fromJson(Timestamp json) => json.toDate();

  @override
  Timestamp toJson(DateTime object) => Timestamp.fromDate(object);
}
