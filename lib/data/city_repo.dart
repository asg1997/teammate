import 'package:shared_preferences/shared_preferences.dart';
import 'package:teammate/data/notifications_repo.dart';

class CityRepo {
  final _notificationsRepo = NotificationsRepo();
  static const _city = 'city';
  Future<String?> getSavedCity() async {
    final shP = await SharedPreferences.getInstance();
    return shP.getString(_city);
  }

  Future<void> saveCity(String city) async {
    await _unsubscribeFromPreviousCity();
    final shP = await SharedPreferences.getInstance();
    await shP.setString(_city, city);
    await _subscribeToCityNotifications(city);
  }

  Future<void> _subscribeToCityNotifications(String city) async {
    await _notificationsRepo.subscribeUserToCity(city);
  }

  Future<void> _unsubscribeFromPreviousCity() async {
    final previousCity = await getSavedCity();
    if (previousCity == null) return;
    await _notificationsRepo.unsubscribeUserFromCity(previousCity);
  }
}
