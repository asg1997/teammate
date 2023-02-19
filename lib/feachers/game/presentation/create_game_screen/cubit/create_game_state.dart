part of 'create_game_cubit.dart';

class CreateGameState extends Equatable {
  final String title;
  final DateTime dateTime;
  final String city;
  final String locationName;
  final Sport sport;

  const CreateGameState(
      {required this.title,
      required this.dateTime,
      required this.city,
      required this.locationName,
      required this.sport});

  factory CreateGameState.initial() => CreateGameState(
        title: '',
        dateTime: DateTime.now(),
        city: '',
        locationName: '',
        sport: Sport.football,
      );

  @override
  List<Object> get props => [
        title,
        dateTime,
        city,
        locationName,
        sport,
      ];

  CreateGameState copyWith({
    String? title,
    DateTime? dateTime,
    String? city,
    String? locationName,
    Sport? sport,
  }) {
    return CreateGameState(
        title: title ?? this.title,
        dateTime: dateTime ?? this.dateTime,
        city: city ?? this.city,
        locationName: locationName ?? this.locationName,
        sport: sport ?? this.sport);
  }
}
