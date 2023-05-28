import 'package:teammate/domain/entities/city.dart';

class SessionData {
  SessionData({
    required this.id,
    this.city,
  });
  // получаем данные с сервера
  factory SessionData.fromJson(Map<String, dynamic> json) {
    final cityJson = json['city'] as Map<String, dynamic>?;
    return SessionData(
      id: json['id'] as String,
      city: cityJson != null ? City.fromJson(cityJson) : null,
    );
  }
  final String id;
  final City? city;

  // на сервер
  Map<String, dynamic> toJson() {
    return {'id': id, 'city': city?.toJson()};
  }

  SessionData copyWith({
    String? id,
    City? city,
  }) {
    return SessionData(
      id: id ?? this.id,
      city: city ?? this.city,
    );
  }
}
