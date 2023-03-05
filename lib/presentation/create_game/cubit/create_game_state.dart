part of 'create_game_cubit.dart';

@freezed
class CreateGameState with _$CreateGameState {
  const factory CreateGameState({
    required String name,
    required DateTime dateTime,
    required City city,
    required String locationName,
    required Sport sport,
    required int currentStep,
    required String error,
    required bool isCreatingGame,
  }) = _CreateGameState;

  const CreateGameState._();

  factory CreateGameState.initial() => CreateGameState(
        name: '',
        dateTime: DateTime(0),
        city: City(name: '', region: ''),
        locationName: '',
        sport: Sport.football,
        currentStep: 0,
        error: '',
        isCreatingGame: false,
      );
}
