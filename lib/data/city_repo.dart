import 'package:shared_preferences/shared_preferences.dart';
import 'package:teammate/service/notifications_service.dart';

class CityRepo {
  static const _city = 'city';
  Future<String?> getSavedCity() async {
    final shP = await SharedPreferences.getInstance();
    return shP.getString(_city);
  }

  Future<void> saveCity(String city) async {
    _unsubscribeFromPreviousCityNotifications();
    final shP = await SharedPreferences.getInstance();
    await shP.setString(_city, city);
    _subscribeToCityNotifications(city);
  }

  Future<void> _subscribeToCityNotifications(String city) async {
    await NotificationsService().subscribeToTopic(city);
  }

  Future<void> _unsubscribeFromPreviousCityNotifications() async {
    final previousCity = await getSavedCity();
    if (previousCity == null) return;
    await NotificationsService().unsubscribeFromTopic(previousCity);
  }
}
