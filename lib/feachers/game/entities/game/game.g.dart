// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Game _$$_GameFromJson(Map<String, dynamic> json) => _$_Game(
      id: json['id'] as String,
      creatorId: json['creatorId'] as String,
      name: json['name'] as String,
      cityCode: json['city'] as int,
      sport: const SportJsonConverter().fromJson(json['sport'] as String),
      location: json['location'] as String,
      description: json['description'] as String?,
      dateTime: const TimeStampJsonConverter()
          .fromJson(json['dateTime'] as Timestamp),
      players:
          (json['players'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_GameToJson(_$_Game instance) => <String, dynamic>{
      'id': instance.id,
      'creatorId': instance.creatorId,
      'name': instance.name,
      'city': instance.cityCode,
      'sport': const SportJsonConverter().toJson(instance.sport),
      'location': instance.location,
      'description': instance.description,
      'dateTime': const TimeStampJsonConverter().toJson(instance.dateTime),
      'players': instance.players,
    };
