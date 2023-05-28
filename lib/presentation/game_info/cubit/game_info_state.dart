part of 'game_info_cubit.dart';

enum GameInfoStatus {
  isLoading,
  loaded,
  isChangingJoinStatus,
  isSharing,
  isLoadingPLayers
}

@freezed
class GameInfoState with _$GameInfoState {
  const factory GameInfoState({
    required List<User> players,
    required Game game,
    required GameInfoStatus status,
  }) = _GameInfoState;
  const GameInfoState._();

  factory GameInfoState.initial(Game game) => GameInfoState(
        players: [],
        game: game,
        status: GameInfoStatus.loaded,
      );

  String get gameDateStr {
    final time = DateFormat('hh:mm').format(game.gameInfo.dateTime);
    final day = dateTimeToDay(game.gameInfo.dateTime);
    return '$day $time';
  }

  String get _myId => SessionDataService.sessionData!.id;

  bool get isMyGame => _myId == game.creatorId;
}
