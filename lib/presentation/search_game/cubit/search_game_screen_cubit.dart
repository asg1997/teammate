import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/core/session_data/session_data_service.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/domain/entities/game/game.dart';
import 'package:teammate/domain/repos/profile_repo.dart';
import 'package:teammate/domain/repos/search_games_repo.dart';

part 'search_game_screen_state.dart';

class SearchGameScreenCubit extends Cubit<SearchGameScreenState> {
  SearchGameScreenCubit({
    required ProfileRepo profileRepo,
    required SearchGamesRepo searchRepo,
  })  : _searchRepo = searchRepo,
        _profileRepo = profileRepo,
        super(SearchGameScreenState.initial());
  final ProfileRepo _profileRepo;
  final SearchGamesRepo _searchRepo;

  Timer? _seachDebounce;

  Future<void> load() async {
    await _getAllGames();
  }

  Future<void> _getAllGames({bool nextPage = false}) async {
    try {
      emit(
        state.copyWith(
          status: nextPage
              ? SearchGameScreenStatus.loadingMore
              : SearchGameScreenStatus.loading,
        ),
      );
      final city = SessionDataService.sessionData?.city;
      final games = await _searchRepo.getAllGames(
        city: city!,
        nextPage: nextPage,
      )
        ..sort((a, b) => a.gameInfo.dateTime.compareTo(b.gameInfo.dateTime));
      if (games.isEmpty) {
        emit(
          state.copyWith(
            status: SearchGameScreenStatus.loaded,
          ),
        );
      } else {
        emit(
          state.copyWith(
            games: [...state.games, ...games],
            status: SearchGameScreenStatus.loaded,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: SearchGameScreenStatus.error));
    }
  }

  Future<void> onSearchChanged(String searchText) async {
    if (searchText.isEmpty) {
      emit(
        state.copyWith(
          status: SearchGameScreenStatus.loaded,
          filteredGames: [],
        ),
      );
    }
    if (searchText.length < 2) return;
    _seachDebounce?.cancel();
    emit(state.copyWith(status: SearchGameScreenStatus.loading));
    _seachDebounce = Timer(const Duration(seconds: 1), () async {
      try {
        final city = SessionDataService.sessionData?.city;
        if (city == null) return;
        final games = await _searchRepo.searchGames(
          city: city,
          searchText: searchText,
        );
        emit(
          state.copyWith(
            filteredGames: games,
            status: SearchGameScreenStatus.search,
          ),
        );
      } catch (e) {
        emit(state.copyWith(status: SearchGameScreenStatus.error));
      }
    });
  }

  void onGameTapped(BuildContext context, Game game) {
    navigatorKey.currentState?.pushNamed(
      AppRoutes.gameInfo,
      arguments: game,
    );
  }

  void loadMore() {
    if (state.status == SearchGameScreenStatus.search) return;
    _getAllGames(nextPage: true);
  }
}
