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
      final relevantGamed = _getRelevantDateGames(games);
      return relevantGamed;
    } catch (e) {
      rethrow;
    }
  }

  List<Game> _getRelevantDateGames(List<Game> games) => games
      .where((element) => element.dateTime.isAfter(DateTime.now()))
      .toList();

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
