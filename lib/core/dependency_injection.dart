import 'package:get_it/get_it.dart';
import 'package:teammate/data/city_repo.dart';
import 'package:teammate/data/current_user_repo.dart';
import 'package:teammate/data/games_repo.dart';
import 'package:teammate/data/local_storage.dart';
import 'package:teammate/data/notifications_repo.dart';
import 'package:teammate/data/players_repo.dart';
import 'package:teammate/data/user_id.dart';
import 'package:teammate/domain/repos/cities_repo.dart';
import 'package:teammate/domain/repos/current_user_repo.dart';
import 'package:teammate/domain/repos/games_repo.dart';
import 'package:teammate/domain/repos/notifications_repo.dart';
import 'package:teammate/domain/repos/players_repo.dart';
import 'package:teammate/domain/repos/user_id.dart';

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
    ..registerLazySingleton<UserIdInfo>(UserIdInfoImpl.new);

  await sl.allReady();
}
