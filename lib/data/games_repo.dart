import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teammate/models/game.dart';

class GamesRepo {
  final _db = FirebaseFirestore.instance;
  static const _games = 'games';

  Future<List<Game>> getGames(String city) async {
    try {
      final snapshot =
          await _db.collection(_games).where('city', isEqualTo: city).get();
      final games = snapshot.docs.map((e) => Game.fromJson(e.data())).toList();
      return games;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createGame(Game game) async {
    try {
      await _db.collection(_games).doc(game.id).set(game.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(Game game) async {
    try {
      await _db.collection(_games).doc(game.id).delete();
    } catch (e) {
      rethrow;
    }
  }
}
