import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:teammate/core/consts/firebase_consts.dart';
import 'package:teammate/core/exception/custom_exception.dart';
import 'package:teammate/domain/entities/city.dart';
import 'package:teammate/domain/entities/game/game.dart';
import 'package:teammate/domain/repos/search_games_repo.dart';
import 'package:teammate/services/api_date_time_converter.dart';

class SearchGamesRepoImpl implements SearchGamesRepo {
  final _db = FirebaseFirestore.instance;
  int get _currentTs => FirestoreDateTimerConverter.to(DateTime.now());
  DocumentSnapshot? _lastDocument;
  List<Game> _parseGames(QuerySnapshot<Map<String, dynamic>> snapshot) =>
      snapshot.docs.map((e) => Game.fromJson(e.data())).toList();

  @override
  Future<List<Game>> getAllGames({
    required City city,
    bool nextPage = false,
  }) async {
    if (nextPage && _lastDocument == null) return [];
    try {
      var query = _db
          .collection(FirebaseConsts.games)
          .where('gameInfo.dateTime', isGreaterThanOrEqualTo: _currentTs)
          .where('gameInfo.city.name', isEqualTo: city.name)
          .where('gameInfo.city.region', isEqualTo: city.region)
          .orderBy('gameInfo.dateTime')
          .limit(6);
      if (nextPage && _lastDocument != null) {
        query = query.startAfterDocument(_lastDocument!);
      }

      final snapshot = await query.get();
      final games = _parseGames(snapshot);
      if (games.length < 6) _lastDocument = null;
      if (games.length >= 6) _lastDocument = snapshot.docs.lastOrNull;
      return games;
    } catch (e) {
      throw CustomException(causedError: e);
    }
  }

  @override
  Future<List<Game>> searchGames({
    required City city,
    required String searchText,
    bool nextPage = false,
  }) async {
    final query = _db
        .collection(FirebaseConsts.games)
        .where('gameInfo.name', isGreaterThanOrEqualTo: searchText)
        .where('gameInfo.city.name', isEqualTo: city.name)
        .where('gameInfo.city.region', isEqualTo: city.region)
        .limit(20);
    final snapshot = await query.get();
    final games = _parseGames(snapshot);
    final now = DateTime.now();
    final actualGames =
        games.where((game) => game.gameInfo.dateTime.isAfter(now)).toList();
    return actualGames;
  }
}
