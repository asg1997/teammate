import 'package:get_it/get_it.dart';
import 'package:teammate/feachers/auth/auth_screen/data/repo/auth_repo_impl.dart';
import 'package:teammate/feachers/auth/auth_screen/domain/repo/auth_repo.dart';
import 'package:teammate/feachers/auth/provider/auth_provider.dart';
import 'package:teammate/feachers/auth/registration_info_screen/data/repo/registration_info_repo_impl.dart';
import 'package:teammate/feachers/auth/registration_info_screen/domain/repo/registration_info_repo.dart';
import 'package:teammate/feachers/game/domain/repos/games_repo.dart';
import 'package:teammate/feachers/profile/data/repos/profile_repo_impl.dart';
import 'package:teammate/feachers/profile/domain/repos/profile_repo.dart';
import 'package:teammate/feachers/search_game/domain/repos/search_games_repo.dart';
import 'package:teammate/feachers/settings/data/repos/settings_repo_impl.dart';
import 'package:teammate/feachers/settings/domain/repos/settings_repo.dart';

import '../feachers/game/data/repos/games_repo_impl.dart';
import '../feachers/search_game/data/repos/search_games_repo_impl.dart';

final sl = GetIt.instance; // sl = Service locator

void init() {
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl());
  sl.registerLazySingleton<AuthProvider>(() => AuthProvider());
  sl.registerLazySingleton<RegistrationInfoRepo>(
      () => RegistrationInfoRepoImpl());
  sl.registerLazySingleton<GamesRepo>(() => GamesRepoImpl());
  sl.registerLazySingleton<SearchGamesRepo>(() => SearchGamesRepoImpl());
  sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl());
  sl.registerLazySingleton<SettingsRepo>(() => SettingsRepoImpl());
}
