import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/cities/entities/city.dart';
import 'package:teammate/feachers/game/data/mapper/city_mapper.dart';

final citiesStorageProvider =
    Provider<CitiesStorage>((ref) => CitiesStorageImpl());

abstract class CitiesStorage {
  Future<Cities> get cities;
}

class CitiesStorageImpl implements CitiesStorage {
  @override
  Future<Cities> get cities async {
    final fromAssets = await _getCitiesFromAssets();
    return fromAssets;
  }

  Future<List<City>> _getCitiesFromAssets() async {
    final data = await rootBundle.loadString('assets/cities/cities.json');
    final jsonList = jsonDecode(data) as List<dynamic>;
    return CityMapper.listFromJson(jsonList);
  }
}
