import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/cities/data/cities_storage.dart';
import 'package:teammate/feachers/cities/data/city_repo.dart';
import 'package:teammate/feachers/cities/entities/city.dart';

final getCurrentCityProvider = FutureProvider<City>((ref) async {
  final saved = await ref.read(cityRepoProvider).getSavedCity();
  if (saved != null) return saved;
  final all = await ref.read(citiesStorageProvider).cities;
  final city = all.first;
  await ref.read(cityRepoProvider).saveCity(city);
  return city;
});
