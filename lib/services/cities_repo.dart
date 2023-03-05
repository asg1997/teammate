import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:teammate/domain/entities/city.dart';

abstract class CitiesRepo {
  CitiesRepo._();

  static Future<List<City>> getCities() => _parseCitiesFromJson();

  static Future<List<City>> _parseCitiesFromJson() async {
    final jsonData = await rootBundle.loadString('assets/cities.json');
    final jsonList = json.decode(jsonData) as List<dynamic>;
    return jsonList
        .map((json) => City.fromJson(json as Map<String, dynamic>))
        .toList()
      ..sort((a, b) => a.name.compareTo(b.name));
  }
}
