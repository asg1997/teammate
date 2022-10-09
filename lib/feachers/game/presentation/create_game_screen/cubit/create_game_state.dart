part of 'create_game_cubit.dart';

class CreateGameState extends Equatable {
  final String title;
  final DateTime dateTime;
  final String city;
  final String locationName;

  const CreateGameState({
    required this.title,
    required this.dateTime,
    required this.city,
    required this.locationName,
  });

  factory CreateGameState.initial() => CreateGameState(
        title: '',
        dateTime: DateTime.now(),
        city: '',
        locationName: '',
      );

  @override
  List<Object> get props => [title, dateTime, city, locationName];

  CreateGameState copyWith({
    String? title,
    DateTime? dateTime,
    String? city,
    String? locationName,
  }) {
    return CreateGameState(
      title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
      city: city ?? this.city,
      locationName: locationName ?? this.locationName,
    );
  }
}
