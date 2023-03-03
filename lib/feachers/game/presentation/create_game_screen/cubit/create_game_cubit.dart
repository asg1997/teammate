import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/feachers/game/domain/entites/game.dart';
import 'package:teammate/feachers/game/domain/entites/sport_.dart';
import 'package:teammate/feachers/game/domain/repos/games_repo.dart';

part 'create_game_state.dart';

class CreateGameCubit extends Cubit<CreateGameState> {
  CreateGameCubit({
    required GamesRepo gamesRepo,
  })  : _gamesRepo = gamesRepo,
        super(CreateGameState.initial());

  final GamesRepo _gamesRepo;

  void onSaveGameTapped(BuildContext context) {
    Navigator.of(context).pop();
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
    Navigator.of(context).pushNamed(
      AppRoutes.stepTwo,
    );
  }

  void onNextThreeTapped(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.stepThree,
    );
  }

  void onSaveTapped(BuildContext context) async {
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
    Navigator.pushNamed(context, AppRoutes.gameInfo, arguments: game);
  }

  void onSportChanged(Sport sport) {
    emit(state.copyWith(sport: sport));
  }
}
