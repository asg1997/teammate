import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teammate/core/bloc_utils/base_status.dart';
import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/feachers/game/domain/repos/games_repo.dart';

import '../../../../game/domain/entites/game.dart';
import '../../../../game/domain/entites/sport_.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit({
    required GamesRepo gamesRepo,
  })  : _gamesRepo = gamesRepo,
        super(MainScreenState.initial());

  final GamesRepo _gamesRepo;
  Future load() async {
    final games = await _gamesRepo.getAllUserGames();
    emit(state.copyWith(games: games, status: BaseStatus.loaded));
  }

  void onAddGameButtonTapped(BuildContext context, Sport sport) async {
    await Navigator.of(context).pushNamed(
      AppRoutes.createGame,
      arguments: sport,
    );
    await load();
  }

  void onSettingsTapped(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.settings,
    );
  }

  void onSearchTapped(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.searchGame,
    );
  }

  void onGameTapped(BuildContext context, Game game) {
    Navigator.of(context).pushNamed(AppRoutes.searchGame, arguments: game);
  }
}
