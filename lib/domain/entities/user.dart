import 'package:teammate/domain/entities/city.dart';

class User {
  const User({
    required this.nickname,
    required this.city,
    required this.id,
  });
  // получаем данные с сервера
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nickname: json['nickname'] as String,
      city: City.fromJson(json['city'] as Map<String, dynamic>),
      id: json['id'] as String,
    );
  }

  final String nickname;
  final City city;
  final String id;

  // на сервер
  Map<String, dynamic> toJson() {
    return {
      'nickname': nickname,
      'city': city.toJson(),
      'id': id,
    };
  }
}
