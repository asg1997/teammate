import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:teammate/feachers/game/domain/entites/sport_.dart';
import 'package:teammate/feachers/game/domain/repos/games_repo.dart';

part 'create_game_state.dart';

class CreateGameCubit extends Cubit<CreateGameState> {
  CreateGameCubit({
    required GamesRepo gamesRepo,
    required Sport sport,
  })  : _gamesRepo = gamesRepo,
        _sport = sport,
        super(CreateGameState.initial());
  final Sport _sport;
  Sport get sport => _sport;
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
}
