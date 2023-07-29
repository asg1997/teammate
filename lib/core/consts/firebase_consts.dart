abstract class FirebaseCollections {
  FirebaseCollections._();
  static const games = 'games';
  static const notifications = 'notificationsSettings';

  // хранится инфа о пользователе
  static const players = 'players';
  // хранятся друзья
  static const teammates = 'teammates';

// TODO: Notification settings?
}

abstract class FirebaseFields {
  FirebaseFields._();
  static const id = 'id';
}
