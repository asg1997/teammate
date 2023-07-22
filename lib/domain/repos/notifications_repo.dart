abstract class NotificationsRepo {
  Future<void> subscribeToCity(String city);
  Future<void> unsubscribeFromCity(String city);
}
