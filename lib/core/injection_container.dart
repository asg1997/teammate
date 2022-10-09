import 'package:get_it/get_it.dart';
import 'package:teammate/feachers/game/domain/repos/games_repo.dart';
import 'package:teammate/feachers/search_game/domain/repos/search_games_repo.dart';

import '../feachers/game/data/repos/games_repo_impl.dart';
import '../feachers/search_game/data/repos/search_games_repo_impl.dart';

final sl = GetIt.instance; // sl = Service locator

void init() {
  sl.registerLazySingleton<GamesRepo>(() => GamesRepoImpl());
  sl.registerLazySingleton<SearchGamesRepo>(() => SearchGamesRepoImpl());
}
