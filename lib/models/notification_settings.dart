import 'package:teammate/models/sport.dart';

class NotificationSettings {
  NotificationSettings({required this.sport, required this.cityPostcode});
  final Map<Sport, bool> sport;
  final int cityPostcode;
}
