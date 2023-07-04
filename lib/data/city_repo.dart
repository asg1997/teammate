import 'package:shared_preferences/shared_preferences.dart';
import 'package:teammate/data/cities.dart';
import 'package:teammate/data/notifications_repo.dart';
import 'package:teammate/domain/cities_repo.dart';

class CityRepoImpl implements CityRepo {
  final _notificationsRepo = NotificationsRepo();
  static const _city = 'city';
  @override
  Future<String?> getSavedCity() async {
    final shP = await SharedPreferences.getInstance();
    return shP.getString(_city);
  }

  @override
  Future<void> saveCity(String city) async {
    await _unsubscribeFromPreviousCity();
    final shP = await SharedPreferences.getInstance();
    await shP.setString(_city, city);
    await _subscribeToCityNotifications(city);
  }

  @override
  Future<List<String>> getCities() async => cities;

  Future<void> _subscribeToCityNotifications(String city) async {
    await _notificationsRepo.subscribeUserToCity(city);
  }

  Future<void> _unsubscribeFromPreviousCity() async {
    final previousCity = await getSavedCity();
    if (previousCity == null) return;
    await _notificationsRepo.unsubscribeUserFromCity(previousCity);
  }
}
