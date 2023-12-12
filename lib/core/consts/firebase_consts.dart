abstract class FirebaseCollections {
  FirebaseCollections._();
  // хранится инфа о пользователе
  static const players = 'players';
  static const games = 'games';
  static const notifications = 'notificationsSettings';
}

abstract class FirebaseFields {
  FirebaseFields._();
  static const id = 'id';
  static const gameName = 'name';
  static const gameDescription = 'description';
  static const location = 'location';
  static const notificationSettings = 'notificationsSettings';
  static const dateTime = 'dateTime';
  static const city = 'city';
}
