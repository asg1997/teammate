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
  Future<void> editGame(GameInfo gameInfo, int id) {
    // TODO: implement editGame
    throw UnimplementedError();
  }
}
