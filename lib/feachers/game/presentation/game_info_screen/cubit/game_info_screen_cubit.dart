import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/bloc_utils/base_status.dart';
import 'package:teammate/feachers/game/domain/repos/games_repo.dart';

import '../../../../profile/domain/entites/user.dart';
import '../../../domain/entites/game.dart';

part 'game_info_screen_state.dart';

class GameInfoScreenCubit extends Cubit<GameInfoScreenState> {
  GameInfoScreenCubit({required GamesRepo gamesRepo, required Game game})
      : _game = game,
        _gamesRepo = gamesRepo,
        super(GameInfoScreenState.initial());

  void load() async {
    emit(state.copyWith(status: BaseStatus.loading));
    if (game.playersIds != null) {
      final players = await _gamesRepo.getGamesPlayers(game.playersIds!);
      emit(state.copyWith(status: BaseStatus.loaded, players: players));
    }
  }

  final GamesRepo _gamesRepo;

  final Game _game;
  Game get game => _game;

  void onInviteUsersTapped() {}
}
