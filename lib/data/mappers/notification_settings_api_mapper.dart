import 'package:teammate/models/notification_settings.dart';
import 'package:teammate/models/sport.dart';

class NotificationSettingsApiMapper {
  NotificationSettingsApiMapper._();

  static NotificationSettings fromApi(Map<String, dynamic> json) {
    return NotificationSettings(
      sport: _sportFromApi(json['sport']),
      cityPostcode: json['cityPostcode'] as int,
    );
  }

  static Map<Sport, bool> _sportFromApi(Map<String, bool> json) => json.map(
        (key, value) => MapEntry(_sportValueFromApi(key), value),
      );

  static Sport _sportValueFromApi(String json) => Sport.values.firstWhere(
        (element) => element.name == json,
      );
  static Map<String, dynamic> toApi(NotificationSettings settings) {
    return {
      'sport': _sportToApi(settings.sport),
      'cityPostcode': settings.cityPostcode,
    };
  }

  static Map<String, bool> _sportToApi(Map<Sport, bool> sport) => sport.map(
        (key, value) => MapEntry(key.name, value),
      );
}
