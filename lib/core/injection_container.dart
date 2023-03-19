import 'package:get_it/get_it.dart';
import 'package:teammate/data/repos/auth_repo_impl.dart';
import 'package:teammate/data/repos/game_repo_impl.dart';
import 'package:teammate/data/repos/games_repo_impl.dart';
import 'package:teammate/data/repos/profile_repo_impl.dart';
import 'package:teammate/data/repos/registration_repo_impl.dart';
import 'package:teammate/data/repos/search_games_repo_impl.dart';
import 'package:teammate/data/repos/settings_repo_impl.dart';
import 'package:teammate/domain/repos/auth_repo.dart';
import 'package:teammate/domain/repos/game_repo.dart';
import 'package:teammate/domain/repos/games_repo.dart';
import 'package:teammate/domain/repos/profile_repo.dart';
import 'package:teammate/domain/repos/registration_repo.dart';
import 'package:teammate/domain/repos/search_games_repo.dart';
import 'package:teammate/domain/repos/settings_repo.dart';

final sl = GetIt.instance; // sl = Service locator

void init() {
  sl
    ..registerLazySingleton<AuthRepo>(AuthRepoImpl.new)
    ..registerLazySingleton<RegistrationRepo>(RegistrationRepoImpl.new)
    ..registerLazySingleton<GamesRepo>(GamesRepoImpl.new)
    ..registerLazySingleton<SearchGamesRepo>(SearchGamesRepoImpl.new)
    ..registerLazySingleton<ProfileRepo>(ProfileRepoImpl.new)
    ..registerLazySingleton<GameRepo>(GameRepoImpl.new)
    ..registerLazySingleton<SettingsRepo>(SettingsRepoImpl.new);
}
