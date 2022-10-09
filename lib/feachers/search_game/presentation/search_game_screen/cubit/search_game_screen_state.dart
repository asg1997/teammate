part of 'search_game_screen_cubit.dart';

class SearchGameScreenState extends Equatable {
  final List<Game> games;
  final bool isFiltersApplied;
  final BaseStatus status;

  const SearchGameScreenState({
    required this.games,
    required this.status,
    required this.isFiltersApplied,
  });

  factory SearchGameScreenState.initial() => const SearchGameScreenState(
      games: [], isFiltersApplied: false, status: BaseStatus.loading);

  SearchGameScreenState copyWith({
    List<Game>? games,
    bool? isFiltersApplied,
    BaseStatus? status,
  }) {
    return SearchGameScreenState(
      games: games ?? this.games,
      isFiltersApplied: isFiltersApplied ?? this.isFiltersApplied,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [games, isFiltersApplied, status];
}
