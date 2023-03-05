// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameInfo _$GameInfoFromJson(Map<String, dynamic> json) => GameInfo(
      name: json['name'] as String,
      location: json['location'] as String,
      city: City.fromJson(json['city'] as Map<String, dynamic>),
      dateTime: FirestoreDateTimerConverter.from(json['dateTime'] as int),
      sport: $enumDecode(_$SportEnumMap, json['sport']),
    );

Map<String, dynamic> _$GameInfoToJson(GameInfo instance) => <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'city': instance.city.toJson(),
      'sport': _$SportEnumMap[instance.sport]!,
      'dateTime': FirestoreDateTimerConverter.to(instance.dateTime),
    };

const _$SportEnumMap = {
  Sport.football: 'football',
  Sport.volleyball: 'volleyball',
  Sport.basketball: 'basketball',
};
