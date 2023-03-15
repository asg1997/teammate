class FirestoreDateTimerConverter {
  FirestoreDateTimerConverter._();

  static DateTime from(int timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp);

  static int to(DateTime dateTime) => dateTime.millisecondsSinceEpoch;
}
