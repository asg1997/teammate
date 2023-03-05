import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teammate/domain/entities/city.dart';
import 'package:teammate/domain/entities/sport.dart';
import 'package:teammate/services/api_date_time_converter.dart';

part 'game_info.g.dart';

@JsonSerializable(explicitToJson: true)
class GameInfo {
  const GameInfo({
    required this.name,
    required this.location,
    required this.city,
    required this.dateTime,
    required this.sport,
  });
  factory GameInfo.fromJson(Map<String, dynamic> json) =>
      _$GameInfoFromJson(json);

  final String name;
  final String location;
  final City city;
  final Sport sport;
  @JsonKey(
    fromJson: FirestoreDateTimerConverter.from,
    toJson: FirestoreDateTimerConverter.to,
  )
  final DateTime dateTime;

  Map<String, dynamic> toJson() => _$GameInfoToJson(this);
}
