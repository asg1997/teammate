import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teammate/feachers/game/entities/sport.dart';

part 'notifs_configs.freezed.dart';
part 'notifs_configs.g.dart';

typedef NotifTypeId = String;
typedef NotifTypes = Map<NotifTypeId, bool>;

typedef SportConfigs = Map<Sport, bool>;

@freezed
class NotifConfigs with _$NotifConfigs {
  const factory NotifConfigs({
    @SportConfigsJsonConverter() required SportConfigs sportConfigs,
    @NotifTypesJsonConverter() required NotifTypes notifTypes,
    @Default(true) bool enabled,
  }) = _NotifConfigs;

  factory NotifConfigs.fromJson(Map<String, dynamic> json) =>
      _$NotifConfigsFromJson(json);
}

class SportConfigsJsonConverter
    extends JsonConverter<SportConfigs, Map<String, dynamic>> {
  const SportConfigsJsonConverter();
  @override
  SportConfigs fromJson(Map<String, dynamic> json) => json.map(
        (key, value) => MapEntry(
          Sport.values.firstWhere((e) => e.name == key),
          value as bool,
        ),
      );

  @override
  Map<String, dynamic> toJson(SportConfigs object) =>
      object.map((key, value) => MapEntry(key.name, value));
}

class NotifTypesJsonConverter
    extends JsonConverter<NotifTypes, Map<String, dynamic>> {
  const NotifTypesJsonConverter();
  @override
  NotifTypes fromJson(Map<String, dynamic> json) =>
      json.map((key, value) => MapEntry(key, value as bool));

  @override
  Map<String, dynamic> toJson(NotifTypes object) => object.map(MapEntry.new);
}
