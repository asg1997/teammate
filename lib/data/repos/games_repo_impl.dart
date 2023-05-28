import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teammate/core/consts/firebase_consts.dart';
import 'package:teammate/core/session_data/session_data_service.dart';
import 'package:teammate/domain/entities/game/game.dart';
import 'package:teammate/domain/entities/user.dart';
import 'package:teammate/domain/repos/games_repo.dart';

class GamesRepoImpl implements GamesRepo {
  GamesRepoImpl();
  final _db = FirebaseFirestore.instance;
  @override
  Future<List<Game>> getAllUserGames() async {
    final userId = SessionDataService.sessionData?.id;
    if (userId == null) throw Exception('no userId');
    final snapshot = await _db
        .collection(FirebaseConsts.games)
        .where(FirebaseConsts.creatorId, isEqualTo: userId)
        .get();
    return _parse(snapshot);
  }

  List<Game> _parse(QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return Game.fromJson(data);
    }).toList();
  }

  @override
  Future<List<User>> getGamesPlayers(List<String> playersIds) async {
    return [];
  }
}
