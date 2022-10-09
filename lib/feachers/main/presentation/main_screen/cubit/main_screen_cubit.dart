import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teammate/core/bloc_utils/base_status.dart';
import 'package:teammate/feachers/game/domain/repos/games_repo.dart';

import '../../../../game/domain/entites/game.dart';

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
}
