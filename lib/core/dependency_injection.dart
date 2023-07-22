import 'package:get_it/get_it.dart';
import 'package:teammate/data/city_repo.dart';
import 'package:teammate/data/games_repo.dart';
import 'package:teammate/data/notifications_repo.dart';
import 'package:teammate/data/user_id.dart';

import 'package:teammate/domain/games_repo.dart';
import 'package:teammate/domain/notifications_repo.dart';
import 'package:teammate/domain/repos/cities_repo.dart';
import 'package:teammate/domain/user_id.dart';

final sl = GetIt.instance;
void init() {
  sl
    ..registerLazySingleton<CityRepo>(() => CityRepoImpl())
    ..registerLazySingleton<NotificationsRepo>(() => NotificationsRepoImpl())
    ..registerLazySingleton<GamesRepo>(() => GamesRepoImpl())
    ..registerLazySingleton<UserIdInfo>(() => UserIdInfoImpl());
}
