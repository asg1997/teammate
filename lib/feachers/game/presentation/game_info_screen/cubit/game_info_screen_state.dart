part of 'game_info_screen_cubit.dart';

class GameInfoScreenState extends Equatable {
  final List<User> players;
  final BaseStatus status;

  const GameInfoScreenState({
    required this.players,
    required this.status,
  });

  factory GameInfoScreenState.initial() => const GameInfoScreenState(
        players: [],
        status: BaseStatus.loading,
      );
  @override
  List<Object> get props => [players, status];

  GameInfoScreenState copyWith({
    List<User>? players,
    BaseStatus? status,
  }) {
    return GameInfoScreenState(
      players: players ?? this.players,
      status: status ?? this.status,
    );
  }
}
