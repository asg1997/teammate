import 'package:teammate/models/sport.dart';

class Game {
  Game({
    required this.id,
    required this.name,
    required this.city,
    required this.sport,
    required this.phone,
    required this.description,
    required this.dateTime,
    required this.creatorPushToken,
    required this.location,
  });
  final String id;

  final String name;
  final String city;
  final Sport sport;
  final String phone;
  final String location;
  final String? description;
  final DateTime dateTime;
  final String creatorPushToken;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'sport': sport.name,
      'phone': phone,
      'description': description,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'creatorPushToken': creatorPushToken,
      'location': location,
    };
  }

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'] as String,
      name: json['name'] as String,
      city: json['city'] as String,
      sport: Sport.fromJson(json['sport'] as String),
      phone: json['phone'] as String,
      description: json['description'] as String?,
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dateTime']),
      creatorPushToken: json['creatorPushToken'] as String,
      location: json['location'] as String,
    );
  }
}
