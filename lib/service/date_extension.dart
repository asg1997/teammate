import 'package:intl/intl.dart';

extension DateString on DateTime {
  /// 01 января 2022
  String get toDateAndTimeString =>
      DateFormat('dd MMMM в HH:mm', 'ru').format(this);

  /// Возравщает сегодня, завтра, послезавтра
  /// Если другое время - возвращает даты
  String get toDayAndTimeString {
    final day = toDayString;
    final time = DateFormat('HH:mm', 'ru').format(this);
    return '$day в $time';
  }

  String get toDayString {
    if (isToday) return 'Сегодня';
    if (isTomorrow) return 'Завтра';
    if (isAfterTomorrow) return 'Послезавтра';
    return DateFormat('dd MMM', 'ru').format(this);
  }

  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool get isTomorrow {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  bool get isAfterTomorrow {
    final now = DateTime.now();
    final dayAfterTomorrow = DateTime(now.year, now.month, now.day + 2);
    return year == dayAfterTomorrow.year &&
        month == dayAfterTomorrow.month &&
        day == dayAfterTomorrow.day;
  }
}
