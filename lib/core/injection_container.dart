import 'package:get_it/get_it.dart';

final sl = GetIt.instance; // sl = Service locator

void init() {
  // sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(nicknameGeneratorRepo: sl()));
  // sl.registerLazySingleton<GamesRepo>(() => GamesRepoImpl());
  // sl.registerLazySingleton<SearchGamesRepo>(() => SearchGamesRepoImpl());
  // sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl());
  // sl.registerLazySingleton<SettingsRepo>(() => SettingsRepoImpl());
  // sl.registerLazySingleton<NicknameGeneratorRepo>(
  //     () => NicknameGeneratorRepoImpl());
}
