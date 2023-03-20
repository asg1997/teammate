import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/core/session_data/session_data_service.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/domain/entities/game/game.dart';
import 'package:teammate/domain/entities/user.dart';
import 'package:teammate/domain/repos/game_repo.dart';
import 'package:teammate/domain/repos/players_repo.dart';
import 'package:teammate/services/daytime_to_day.dart';

part 'game_info_cubit.freezed.dart';
part 'game_info_state.dart';

class GameInfoCubit extends Cubit<GameInfoState> {
  GameInfoCubit({
    required this.playersRepo,
    required this.gameRepo,
    required Game game,
  }) : super(GameInfoState.initial(game));

  final PlayersRepo playersRepo;
  final GameRepo gameRepo;

  User? _me;

  String get joinTitle =>
      state.players.contains(_me) ? 'Выйти' : 'Присоединиться';

  Future<void> init() async {
    await _getPlayers();
    // можно оптимизировать:
    // если в массиве пользователей уже есть мой id
    // не надо делать запрос на сервер лишний
    _me = (await playersRepo.getPlayers([state._myId])).firstOrNull;
  }

  Future<void> _getPlayers() async {
    emit(state.copyWith(status: GameInfoStatus.isLoadingPLayers));
    final players = await playersRepo.getPlayers(state.game.playersIds);
    emit(
      state.copyWith(
        players: players,
        status: GameInfoStatus.loaded,
      ),
    );
  }

  Future<void> onInviteUsersTapped() async {
    if (state.status == GameInfoStatus.isSharing) return;
    emit(state.copyWith(status: GameInfoStatus.isSharing));
    final gameInfo = state.game.gameInfo;
    final gameStr = gameInfo.sport.localized.toLowerCase();
    final whenStr = dateTimeToDay(gameInfo.dateTime).toLowerCase();
    // todo: можно поделить url
    await Share.share('Сыграем $whenStr в $gameStr? Присоединяйся!');
    emit(state.copyWith(status: GameInfoStatus.loaded));
  }

  Future<void> onEditTapped() async {
    await navigatorKey.currentState?.pushNamed(
      AppRoutes.editGame,
      arguments: state.game.id,
    );

    final game = await gameRepo.getGame(id: state.game.id);
    emit(state.copyWith(game: game));
  }

  Future<void> onJoinToggle() async {
    emit(state.copyWith(status: GameInfoStatus.isChangingJoinStatus));

    List<User> newPlayers;

    if (state.players.contains(_me)) {
      {
        newPlayers = [...state.players]..remove(_me);
        await playersRepo.removePlayer(
          gameId: state.game.id,
          playerId: state._myId,
        );
      }
    } else {
      newPlayers = [...state.players, _me!];
      await playersRepo.addPlayer(
        gameId: state.game.id,
        playerId: state._myId,
      );
    }

    // notifyListeners();

    emit(
      state.copyWith(
        status: GameInfoStatus.loaded,
        players: newPlayers,
      ),
    );
  }
}
