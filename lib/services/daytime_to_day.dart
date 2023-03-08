import 'package:intl/intl.dart';

String dateTimeToDay(DateTime dateTime) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  final dayAfterTomorrow = DateTime(now.year, now.month, now.day + 2);
  final dateTimeDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

  if (dateTimeDate == today) {
    return 'Сегодня';
  } else if (dateTimeDate == tomorrow) {
    return 'Завтра';
  } else if (dateTimeDate == dayAfterTomorrow) {
    return 'Послезавтра';
  } else if (dateTimeDate.isAfter(dayAfterTomorrow)) {
    final format = DateFormat('dd MMMM', 'ru');
    return format.format(dateTimeDate);
  } else {
    return 'Invalid date';
  }
}
