import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/cities/entities/city.dart';
import 'package:teammate/feachers/cities/providers/get_cities.dart';

final getCityByPostcodeProvider =
    FutureProvider.autoDispose.family<City, int>((ref, postcode) async {
  final allCities = await ref.watch(getCitiesProvider.future);
  final city = allCities.firstWhere((element) => element.postcode == postcode);
  return city;
});
