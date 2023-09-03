import 'package:teammate/feachers/cities/entities/city.dart';

class CityMapper {
  CityMapper._();
  static List<City> listFromJson(List<dynamic> json) {
    return json.map((e) {
      e as Map<String, dynamic>;
      return fromJson(e);
    }).toList();
  }

  static City fromJson(Map<String, dynamic> json) {
    return City(
      name: json['city'] as String,
      postcode: int.parse(json['code'] as String),
    );
  }

  static Map<String, dynamic> toJson(City city) {
    return {
      'city': city.name,
      'code': city.postcode.toString(),
    };
  }
}
