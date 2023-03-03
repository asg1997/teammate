import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/utils/base_status.dart';
import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/feachers/game/domain/entites/game.dart';
import 'package:teammate/feachers/profile/domain/repos/profile_repo.dart';
import 'package:teammate/feachers/search_game/domain/repos/search_games_repo.dart';

part 'search_game_screen_state.dart';

class SearchGameScreenCubit extends Cubit<SearchGameScreenState> {
  SearchGameScreenCubit(
      {required ProfileRepo profileRepo, required SearchGamesRepo searchRepo})
      : _searchRepo = searchRepo,
        _profileRepo = profileRepo,
        super(SearchGameScreenState.initial());
  final ProfileRepo _profileRepo;
  final SearchGamesRepo _searchRepo;

  Timer? _seachDebounce;

  Future<void> load() async {
    final user = await _profileRepo.getUserInfo();
    final games = await _searchRepo.getGames(SearchGameParams(city: user.city));
    emit(state.copyWith(games: games, status: BaseStatus.loaded));
  }

  // Поиск по названию
  void onSearchChanged(String value) async {
    if (value.length < 2) return;
    emit(state.copyWith(status: BaseStatus.loading));
    _seachDebounce?.cancel();
    _seachDebounce = Timer(const Duration(seconds: 1), () async {
      try {
        emit(state.copyWith(status: BaseStatus.loading));
        final games =
            await _searchRepo.getGames(SearchGameParams(title: value));
        emit(state.copyWith(status: BaseStatus.loaded, games: games));
      } catch (e) {
        emit(state.copyWith(status: BaseStatus.error));
      }
    });
  }

  void onGameTapped(BuildContext context, Game game) {
    Navigator.of(context).pushNamed(
      AppRoutes.gameInfo,
      arguments: game,
    );
  }
}
