import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/cities/data/city_storage.dart';
import 'package:teammate/feachers/cities/entities/city.dart';

final savedCityNotifierProvider =
    StateNotifierProvider<SavedCityNotifierProvider, City?>(
  SavedCityNotifierProvider.new,
);

class SavedCityNotifierProvider extends StateNotifier<City?> {
  SavedCityNotifierProvider(this.ref) : super(null);

  final Ref ref;

  Future<void> init() async {
    state = await ref.read(cityStorageProvider).getSavedCity();
  }

  Future<void> saveCity(City city) async {
    await ref.read(cityStorageProvider).saveCity(city);
    state = city;
  }
}
