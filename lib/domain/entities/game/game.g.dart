// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      gameInfo: GameInfo.fromJson(json['gameInfo'] as Map<String, dynamic>),
      creatorId: json['creatorId'] as String,
      id: json['id'] as String,
      playersIds: (json['playersIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'id': instance.id,
      'creatorId': instance.creatorId,
      'gameInfo': instance.gameInfo.toJson(),
      'playersIds': instance.playersIds,
    };
