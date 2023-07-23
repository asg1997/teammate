import 'package:teammate/models/city.dart';

class CityMapper {
  CityMapper._();
  static List<City> listFromJson(List<dynamic> json) {
    return json
        .map((e) => City(
              name: e['name'] as String,
              postcode: e['code'] as int,
            ))
        .toList();
  }

  static City fromJson(Map<String, dynamic> json) {
    return City(
      name: json['name'] as String,
      postcode: json['code'] as int,
    );
  }

  static Map<String, dynamic> toJson(City city) {
    return {
      'name': city.name,
      'postcode': city.postcode,
    };
  }
}
