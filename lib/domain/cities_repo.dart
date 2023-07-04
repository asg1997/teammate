abstract class CityRepo {
  Future<String?> getSavedCity();
  Future<void> saveCity(String city);
  Future<List<String>> getCities();
}
