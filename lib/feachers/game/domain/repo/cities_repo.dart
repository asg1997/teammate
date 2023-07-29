import 'package:teammate/feachers/game/domain/entities/city.dart';

abstract class CityRepo {
  Future<City?> getSavedCity();
  Future<void> saveCity(City city);
}
