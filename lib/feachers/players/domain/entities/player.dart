import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teammate/feachers/notifications/domain/notifs_configs/notifs_configs.dart';

part 'player.freezed.dart';

typedef PlayerId = String;

@freezed
class Player with _$Player {
  const factory Player({
    required String nickname,
    required PlayerId id,
    String? pushToken,
    NotifConfigs? notificationsSettings,
    @Default(<String>[]) teammatesIds,
  }) = _Player;
}
