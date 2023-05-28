import 'package:teammate/domain/entities/user.dart';

abstract class PlayersRepo {
  Future<List<User>> getPlayers(List<String> playersIds);
  Future<void> addPlayer({
    required String gameId,
    required String playerId,
  });

  Future<void> removePlayer({
    required String gameId,
    required String playerId,
  });
}
