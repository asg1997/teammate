import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teammate/feachers/notifications/domain/entities/notification_settings.dart';
part 'player.freezed.dart';

typedef PlayerId = String;

@freezed
class Player with _$Player {
  const factory Player({
    required String nickname,
    required PlayerId id,
    String? pushToken,
    NotificationSettings? notificationsSettings,
    @Default(<String>[]) teammatesIds,
  }) = _Player;
}
