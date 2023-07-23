import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:teammate/data/mappers/city_mapper.dart';
import 'package:teammate/models/city.dart';

class CitiesStorage {
  factory CitiesStorage() => _instance;
  CitiesStorage._();
  static final _instance = CitiesStorage._();

  Future<void> init() async {
    _cities = await _getCitiesFromAssets();
  }

  List<City> get cities => _cities;
  List<City> _cities = [];

  City fromPostcode(int postcode) =>
      _cities.firstWhere((element) => element.postcode == postcode);

  Future<List<City>> _getCitiesFromAssets() async {
    final data = await rootBundle.loadString('assets/cities/cities.json');
    final jsonList = jsonDecode(data) as List<dynamic>;
    return CityMapper.listFromJson(jsonList);
  }
}
