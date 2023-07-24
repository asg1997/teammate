import 'package:teammate/data/session_data.dart';
import 'package:teammate/models/sport.dart';

class Game {
  Game({
    required this.id,
    required this.name,
    required this.cityCode,
    required this.sport,
    required this.phone,
    required this.description,
    required this.dateTime,
    required this.location,
    required this.creatorId,
  });
  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'] as String,
      name: json['name'] as String,
      cityCode: json['city'] as int,
      sport: Sport.fromJson(json['sport'] as String),
      phone: json['phone'] as String,
      description: json['description'] as String?,
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dateTime'] as int),
      creatorId: json['creatorId'] as String,
      location: json['location'] as String,
    );
  }

  final String id;
  final String name;
  final int cityCode;
  final Sport sport;
  final String phone;
  final String location;
  final String? description;
  final DateTime dateTime;
  final String creatorId;

  bool get isMy => SessionData().userId == creatorId;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'city': cityCode,
      'sport': sport.name,
      'phone': phone,
      'description': description,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'creatorId': creatorId,
      'location': location,
    };
  }
}
