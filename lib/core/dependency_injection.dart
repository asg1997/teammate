import 'package:get_it/get_it.dart';
import 'package:teammate/feachers/auth/data/repo/current_user_repo.dart';
import 'package:teammate/feachers/auth/data/repo/local_storage.dart';
import 'package:teammate/feachers/auth/data/repo/user_id.dart';
import 'package:teammate/feachers/auth/domain/repo/current_user_repo.dart';
import 'package:teammate/feachers/auth/domain/repo/user_id.dart';
import 'package:teammate/feachers/game/data/repo/city_repo.dart';
import 'package:teammate/feachers/game/data/repo/games_repo.dart';
import 'package:teammate/feachers/game/data/repo/players_repo.dart';
import 'package:teammate/feachers/game/domain/repo/cities_repo.dart';
import 'package:teammate/feachers/game/domain/repo/games_repo.dart';
import 'package:teammate/feachers/game/domain/repo/players_repo.dart';
import 'package:teammate/feachers/notifications/data/repo/notifications_repo.dart';
import 'package:teammate/feachers/notifications/domain/repo/notifications_repo.dart';
import 'package:teammate/feachers/players/data/datasource/players_local_storage.dart';
import 'package:teammate/feachers/players/data/datasource/players_remote_storage.dart';
import 'package:teammate/feachers/players/data/repo/teammates_repo.dart';
import 'package:teammate/feachers/players/domain/repo/teammates_repo.dart';

final sl = GetIt.instance;
Future<void> init() async {
  final localStorage = LocalStorageImpl();
  await localStorage.init();

  final nicknameRepo = CurrentUserRepoImpl(localStorage: localStorage);

  sl
    ..registerLazySingleton<CurrentUserRepo>(() => nicknameRepo)
    ..registerLazySingleton<PlayersRepo>(PlayersRepoImpl.new)
    ..registerLazySingleton<CityRepo>(CityRepoImpl.new)
    ..registerLazySingleton<NotificationsRepo>(NotificationsRepoImpl.new)
    ..registerLazySingleton<GamesRepo>(GamesRepoImpl.new)
    ..registerLazySingleton<PlayersLocalStorage>(
      () => PlayersLocalStorageImpl(sl()),
    )
    ..registerLazySingleton<PlayersRemoteStorage>(
      PlayersRemoteStorageImpl.new,
    )
    ..registerLazySingleton<PlayersStorage>(
      () => PlayersStorageImpl(localStorage: sl(), remoteStorage: sl()),
    )
    ..registerLazySingleton<UserIdInfo>(UserIdInfoImpl.new);

  await sl.allReady();
}
