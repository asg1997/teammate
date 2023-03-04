import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/domain/entities/game.dart';
import 'package:teammate/domain/entities/sport.dart';
import 'package:teammate/domain/repos/games_repo.dart';

part 'create_game_state.dart';

class CreateGameCubit extends Cubit<CreateGameState> {
  CreateGameCubit({
    required GamesRepo gamesRepo,
  })  : _gamesRepo = gamesRepo,
        super(CreateGameState.initial());

  final GamesRepo _gamesRepo;

  void onSaveGameTapped(BuildContext context) {
    navigatorKey.currentState?.pop();
  }

  void onNameChanged(String value) {
    emit(state.copyWith(title: value));
  }

  void onCityChanged(String value) {
    emit(state.copyWith(city: value));
  }

  void onPlaceChanged(String value) {
    emit(state.copyWith(locationName: value));
  }

  void onDateTimeChanged(String value) {
    // emit(state.copyWith(dateTime: value));
  }

  void onNextTwoTapped(BuildContext context) {
    navigatorKey.currentState?.pushNamed(
      AppRoutes.stepTwo,
    );
  }

  void onNextThreeTapped(BuildContext context) {
    navigatorKey.currentState?.pushNamed(
      AppRoutes.stepThree,
    );
  }

  Future<void> onSaveTapped(BuildContext context) async {
    final game = Game(
      name: state.title,
      location: state.locationName,
      dateTime: state.dateTime,
      sport: state.sport,
      id: '1',
      playersIds: [],
      city: state.city,
    );
    Navigator.popUntil(context, (route) => route.isFirst);
    await Navigator.pushNamed(context, AppRoutes.gameInfo, arguments: game);
  }

  void onSportChanged(Sport sport) {
    emit(state.copyWith(sport: sport));
  }
}
