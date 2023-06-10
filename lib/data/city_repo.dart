import 'package:shared_preferences/shared_preferences.dart';
import 'package:teammate/service/notifications_service.dart';
import 'package:translit/translit.dart';

class CityRepo {
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
    final topic = _cityToTopicName(city);
    await NotificationsService().subscribeToTopic(topic);
  }

  String _cityToTopicName(String city) {
    return Translit().toTranslit(source: city);
  }

  Future<void> _unsubscribeFromPreviousCity() async {
    final previousCity = await getSavedCity();
    if (previousCity == null) return;
    final topic = _cityToTopicName(previousCity);
    await NotificationsService().unsubscribeFromTopic(topic);
  }
}
