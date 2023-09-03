import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teammate/feachers/game/entities/sport.dart';

part 'notification_settings.freezed.dart';

@freezed
class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings({
    required Map<Sport, bool> sport,
    required int cityPostcode,
    required bool onGameTeammatesChanged,
    required bool onGameDateTimeChanged,
    required bool gameStartsInTwoHours,
    required bool gameWasDeleted,
    required bool myTeammateCreatedNewGame,
    @Default(true) bool enabled,
  }) = _NotificationSettings;
}
