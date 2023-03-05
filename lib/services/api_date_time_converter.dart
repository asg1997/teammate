class FirestoreDateTimerConverter {
  FirestoreDateTimerConverter._();

  static DateTime from(int timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

  static int to(DateTime dateTime) => dateTime.toUtc().millisecondsSinceEpoch;
}
