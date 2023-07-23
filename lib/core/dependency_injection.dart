import 'package:get_it/get_it.dart';
import 'package:teammate/data/city_repo.dart';
import 'package:teammate/data/games_repo.dart';
import 'package:teammate/data/notifications_repo.dart';
import 'package:teammate/data/user_id.dart';

import 'package:teammate/domain/repos/games_repo.dart';
import 'package:teammate/domain/repos/notifications_repo.dart';
import 'package:teammate/domain/repos/cities_repo.dart';
import 'package:teammate/domain/repos/user_id.dart';

final sl = GetIt.instance;
void init() {
  sl
    ..registerLazySingleton<CityRepo>(() => CityRepoImpl())
    ..registerLazySingleton<NotificationsRepo>(() => NotificationsRepoImpl())
    ..registerLazySingleton<GamesRepo>(() => GamesRepoImpl())
    ..registerLazySingleton<UserIdInfo>(() => UserIdInfoImpl());
}
