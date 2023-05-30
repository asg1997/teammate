import 'package:shared_preferences/shared_preferences.dart';

class CityRepo {
  static const _city = 'city';
  Future<String?> getSavedCity() async {
    final shP = await SharedPreferences.getInstance();
    return shP.getString(_city);
  }

  Future<void> saveCity(String city) async {
    final shP = await SharedPreferences.getInstance();
    await shP.setString(_city, city);
  }
}
