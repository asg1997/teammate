import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teammate/domain/games_repo.dart';
import 'package:teammate/models/game.dart';

class GamesRepoImpl implements GamesRepo {
  final _gamesRef = FirebaseFirestore.instance.collection('games');

  DocumentSnapshot? _lastDocument;

  @override
  Future<List<Game>> getGames(String city, {int limit = 10}) async {
    try {
      var query = _gamesRef.where('city', isEqualTo: city);

      if (_lastDocument != null) {
        query = query.startAfterDocument(_lastDocument!);
      }

      final snapshot = await query.limit(limit).get();
      if (snapshot.docs.isNotEmpty) _lastDocument = snapshot.docs.last;
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
      await _gamesRef.doc(game.id).set(game.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(Game game) async {
    try {
      await _gamesRef.doc(game.id).delete();
    } catch (e) {
      rethrow;
    }
  }
}
