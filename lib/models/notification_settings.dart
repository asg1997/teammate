import 'package:teammate/models/sport.dart';

class NotificationSettings {
  final Map<Sport, bool> sport;
  final int cityPostcode;

  NotificationSettings({required this.sport, required this.cityPostcode});
}
