import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teammate/feachers/search_game/domain/repos/search_games_repo.dart';

part 'search_game_screen_state.dart';

class SearchGameScreenCubit extends Cubit<SearchGameScreenState> {
  SearchGameScreenCubit({required SearchGamesRepo searchRepo})
      : _searchRepo = searchRepo,
        super(SearchGameScreenInitial());
  final SearchGamesRepo _searchRepo;
}
