import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teammate/data/mappers/game_mapper.dart';
import 'package:teammate/domain/repos/games_repo.dart';
import 'package:teammate/models/city.dart';
import 'package:teammate/models/game.dart';

class GamesRepoImpl implements GamesRepo {
  final _gamesRef = FirebaseFirestore.instance.collection('games');

  DocumentSnapshot? _lastDocument;

  @override
  Future<List<Game>> getGames(City city, {int limit = 10}) async {
    try {
      var query = _gamesRef.where('city', isEqualTo: city.postcode);

      if (_lastDocument != null) {
        query = query.startAfterDocument(_lastDocument!);
      }

      final snapshot = await query.limit(limit).get();
      if (snapshot.docs.isNotEmpty) _lastDocument = snapshot.docs.last;
      final games =
          snapshot.docs.map((e) => GameMapper.fromApi(e.data())).toList();
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
      await _gamesRef.doc(game.id).set(GameMapper.toApi(game));
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
