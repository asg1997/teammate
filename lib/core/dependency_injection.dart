import 'package:get_it/get_it.dart';
import 'package:teammate/data/city_repo.dart';
import 'package:teammate/data/games_repo.dart';
import 'package:teammate/data/user_id.dart';
import 'package:teammate/domain/cities_repo.dart';
import 'package:teammate/domain/games_repo.dart';
import 'package:teammate/domain/user_id.dart';

final sl = GetIt.instance;
void init() {
  sl
    ..registerLazySingleton<CityRepo>(() => CityRepoImpl())
    ..registerLazySingleton<GamesRepo>(() => GamesRepoImpl())
    ..registerLazySingleton<UserIdInfo>(() => UserIdInfoImpl());
}
