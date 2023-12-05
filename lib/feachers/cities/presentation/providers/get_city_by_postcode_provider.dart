import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/cities/entities/city.dart';
import 'package:teammate/feachers/cities/presentation/providers/get_cities.dart';

final getCityByPostcodeProvider =
    Provider.autoDispose.family<City, int>((ref, postcode) {
  final allCities = ref.watch(getCitiesProvider);
  final city = allCities.firstWhere((element) => element.postcode == postcode);
  return city;
});
