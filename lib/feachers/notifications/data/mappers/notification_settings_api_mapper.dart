import 'package:teammate/feachers/notifications/domain/notifs_configs/notifs_configs.dart';

class NotifConfigsApiMapper {
  NotifConfigsApiMapper._();

  static NotifConfigs fromApi(Map<String, dynamic> json) {
    return NotifConfigs.fromJson(json);
  }

  static Map<String, dynamic> toApi(NotifConfigs settings) {
    return settings.toJson();
  }
}
