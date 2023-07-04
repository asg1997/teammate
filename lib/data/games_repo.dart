import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teammate/domain/games_repo.dart';
import 'package:teammate/models/game.dart';

class GamesRepoImpl implements GamesRepo {
  final _db = FirebaseFirestore.instance;
  static const _games = 'games';

  @override
  Future<List<Game>> getGames(String city) async {
    try {
      final snapshot =
          await _db.collection(_games).where('city', isEqualTo: city).get();
      final games = snapshot.docs.map((e) => Game.fromJson(e.data())).toList();
      final relevantGames = _getRelevantDateGames(games);
      return relevantGames;
    } catch (e) {
      rethrow;
    }
  }

  List<Game> _getRelevantDateGames(List<Game> games) => games
      .where((element) => element.dateTime.isAfter(DateTime.now()))
      .toList();

  @override
  Future<void> createGame(Game game) async {
    try {
      await _db.collection(_games).doc(game.id).set(game.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(Game game) async {
    try {
      await _db.collection(_games).doc(game.id).delete();
    } catch (e) {
      rethrow;
    }
  }
}
