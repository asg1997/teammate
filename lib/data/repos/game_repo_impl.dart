import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teammate/core/consts/firebase_consts.dart';
import 'package:teammate/core/session_data/session_data_service.dart';
import 'package:teammate/domain/entities/game/game.dart';
import 'package:teammate/domain/entities/game_info/game_info.dart';
import 'package:teammate/domain/repos/game_repo.dart';
import 'package:uuid/uuid.dart';

class GameRepoImpl implements GameRepo {
  final _db = FirebaseFirestore.instance;

  @override
  Future<Game> createGame(GameInfo gameInfo) async {
    final creatorId = SessionDataService.sessionData?.id;

    if (creatorId == null) throw Exception('no user id');

    final id = const Uuid().v1();
    final game = Game(
      gameInfo: gameInfo,
      creatorId: creatorId,
      id: id,
    );
    final json = game.toJson();
    await _db.collection(FirebaseConsts.games).doc(id).set(json);

    return game;
  }

  @override
  Future<void> editGame({
    required GameInfo gameInfo,
    required String id,
  }) async {
    await _db
        .collection(FirebaseConsts.games)
        .doc(id)
        .update({'gameInfo': gameInfo.toJson()});
  }

  @override
  Future<Game> getGame({required String id}) async {
    final snapshot = await _db.collection(FirebaseConsts.games).doc(id).get();
    final date = snapshot.data();
    if (date == null) throw Exception('no data catching game');
    final game = Game.fromJson(date);
    return game;
  }

  @override
  Future<void> deleteGame({required String id}) {
    // TODO: implement deleteGame
    throw UnimplementedError();
  }
}
