import 'package:teammate/feachers/game/domain/entites/game.dart';
import 'package:teammate/feachers/game/domain/repos/games_repo.dart';

class GamesRepoImpl implements GamesRepo {
  GamesRepoImpl();

  @override
  Future<List<Game>> getAllUserGames() async {
    return [];
    // final now = DateTime.now();
    // return [
    //   Game(
    //     name: 'Имя игры',
    //     location: const GameLocation(name: 'к25'),
    //     dateTime: DateTime(now.year, now.month, now.day + 1),
    //     sport: Sport.football,
    //   ),
    //   Game(
    //     name: 'Имя игры',
    //     location: const GameLocation(name: 'к25'),
    //     dateTime: DateTime(now.year, now.month, now.day - 1),
    //     sport: Sport.football,
    //   ),
    //   Game(
    //     name: 'Имя игры',
    //     location: const GameLocation(name: 'к25'),
    //     dateTime: DateTime(now.year, now.month, now.day + 2),
    //     sport: Sport.football,
    //   ),
    //   Game(
    //     name: 'Имя игры',
    //     location: const GameLocation(name: 'к25'),
    //     dateTime: DateTime.now(),
    //     sport: Sport.football,
    //   ),
    // ];
  }
}
