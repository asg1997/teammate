part of 'search_game_screen_cubit.dart';

enum SearchGameScreenStatus { loading, loaded, search, error, loadingMore }

class SearchGameScreenState extends Equatable {
  const SearchGameScreenState({
    required this.games,
    required this.filteredGames,
    required this.status,
    required this.isFiltersApplied,
  });

  factory SearchGameScreenState.initial() => const SearchGameScreenState(
        games: [],
        isFiltersApplied: false,
        status: SearchGameScreenStatus.loading,
        filteredGames: [],
      );
  final List<Game> filteredGames;
  final List<Game> games;
  final bool isFiltersApplied;
  final SearchGameScreenStatus status;

  @override
  List<Object> get props => [
        games,
        isFiltersApplied,
        status,
        filteredGames,
      ];

  SearchGameScreenState copyWith({
    List<Game>? filteredGames,
    List<Game>? games,
    bool? isFiltersApplied,
    SearchGameScreenStatus? status,
  }) {
    return SearchGameScreenState(
      filteredGames: filteredGames ?? this.filteredGames,
      games: games ?? this.games,
      isFiltersApplied: isFiltersApplied ?? this.isFiltersApplied,
      status: status ?? this.status,
    );
  }
}
