import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teammate/core/consts/firebase_consts.dart';
import 'package:teammate/domain/entities/user.dart';
import 'package:teammate/domain/repos/players_repo.dart';

class PlayersRepoImpl implements PlayersRepo {
  final _db = FirebaseFirestore.instance;

  @override
  Future<void> addPlayer({
    required String gameId,
    required String playerId,
  }) async {
    await _db.collection(FirebaseConsts.games).doc(gameId).update({
      'playersIds': FieldValue.arrayUnion([playerId])
    });
  }

  @override
  Future<void> removePlayer({
    required String gameId,
    required String playerId,
  }) async {
    await _db.collection(FirebaseConsts.games).doc(gameId).update({
      'playersIds': FieldValue.arrayRemove([playerId])
    });
  }

  @override
  Future<List<User>> getPlayers(List<String> playersIds) async {
    if (playersIds.isEmpty) return [];
    // TODO: Что если playersIds.lenth > 10? По-моему это не нравиться firebase
    final snapshot = await _db
        .collection(FirebaseConsts.users)
        .where('id', whereIn: playersIds)
        .get();

    final players = snapshot.docs.map((e) {
      final json = e.data();
      return User.fromJson(json);
    }).toList();
    return players;
  }
}
