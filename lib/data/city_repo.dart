import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:teammate/data/mappers/city_mapper.dart';

import 'package:teammate/domain/repos/cities_repo.dart';
import 'package:teammate/models/city.dart';

class CityRepoImpl implements CityRepo {
  static const _city = 'city';

  @override
  Future<City?> getSavedCity() async {
    final shP = await SharedPreferences.getInstance();

    final json = shP.getString(_city);
    if (json == null) return null;

    final map = jsonDecode(json);
    return CityMapper.fromJson(map);
  }

  @override
  Future<void> saveCity(City city) async {
    final shP = await SharedPreferences.getInstance();

    final map = CityMapper.toJson(city);
    final json = jsonEncode(map);
    await shP.setString(_city, json);
  }
}
