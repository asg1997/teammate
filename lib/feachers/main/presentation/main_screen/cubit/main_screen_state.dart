part of 'main_screen_cubit.dart';

class MainScreenState extends Equatable {
  final BaseStatus status;
  final List<Game> games;
  const MainScreenState({
    required this.status,
    required this.games,
  });
  factory MainScreenState.initial() =>
      const MainScreenState(games: [], status: BaseStatus.loading);

  MainScreenState copyWith({
    BaseStatus? status,
    List<Game>? games,
  }) {
    return MainScreenState(
      status: status ?? this.status,
      games: games ?? this.games,
    );
  }

  @override
  List<Object> get props => [games, status];
}
