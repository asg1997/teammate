// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifs_configs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotifConfigs _$$_NotifConfigsFromJson(Map<String, dynamic> json) =>
    _$_NotifConfigs(
      sportConfigs: const SportConfigsJsonConverter()
          .fromJson(json['sportConfigs'] as Map<String, dynamic>),
      notifTypes: const NotifTypesJsonConverter()
          .fromJson(json['notifTypes'] as Map<String, dynamic>),
      enabled: json['enabled'] as bool? ?? true,
    );

Map<String, dynamic> _$$_NotifConfigsToJson(_$_NotifConfigs instance) =>
    <String, dynamic>{
      'sportConfigs':
          const SportConfigsJsonConverter().toJson(instance.sportConfigs),
      'notifTypes': const NotifTypesJsonConverter().toJson(instance.notifTypes),
      'enabled': instance.enabled,
    };
