import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teammate/feachers/cities/entities/city.dart';
import 'package:teammate/feachers/game/data/mapper/city_mapper.dart';

final cityRepoProvider = Provider<CityRepo>((ref) => CityRepoImpl());

abstract class CityRepo {
  Future<City?> getSavedCity();
  Future<void> saveCity(City city);
}

class CityRepoImpl implements CityRepo {
  static const _city = 'city';

  @override
  Future<City?> getSavedCity() async {
    final shP = await SharedPreferences.getInstance();
    try {
      final json = shP.getString(_city);
      if (json == null) return null;

      final map = jsonDecode(json);
      return CityMapper.fromJson(map as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveCity(City city) async {
    final shP = await SharedPreferences.getInstance();

    final map = CityMapper.toJson(city);
    final json = jsonEncode(map);
    await shP.setString(_city, json);
  }
}
