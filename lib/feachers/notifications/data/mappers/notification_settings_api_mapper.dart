import 'package:teammate/feachers/game/entities/sport.dart';
import 'package:teammate/feachers/notifications/domain/entities/notification_settings.dart';

class NotificationSettingsApiMapper {
  NotificationSettingsApiMapper._();

  static NotificationSettings fromApi(Map<String, dynamic> json) {
    // FirebaseFirestore.instance..collection('notification_settings'). doc('new_game_in_city').update({'0121312': FieldValue.arrayUnion(elements)});
    return NotificationSettings(
      sport: _sportFromApi(json['sport'] as Map<String, dynamic>),
      cityPostcode: json['cityPostcode'] as int,
      gameStartsInTwoHours: json['cityPostcode'] as bool,
      gameWasDeleted: json['cityPostcode'] as bool,
      myTeammateCreatedNewGame: json['cityPostcode'] as bool,
      onGameDateTimeChanged: json['onGameDateTimeChanged'] as bool,
      onGameTeammatesChanged: json['onGameTeammatesChanged'] as bool,
    );
  }

  static Map<Sport, bool> _sportFromApi(Map<String, dynamic> json) => json.map(
        (key, value) => MapEntry(_sportValueFromApi(key), value as bool),
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
