import 'package:teammate/models/city.dart';

abstract class CityRepo {
  Future<City?> getSavedCity();
  Future<void> saveCity(City city);
}
