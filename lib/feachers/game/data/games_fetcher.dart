import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/consts/app_consts.dart';
import 'package:teammate/core/consts/firebase_consts.dart';
import 'package:teammate/core/exceptions/custom_exception.dart';
import 'package:teammate/core/extensions/safety_index.dart';
import 'package:teammate/feachers/cities/entities/city.dart';
import 'package:teammate/feachers/game/data/mapper/game_mapper.dart';
import 'package:teammate/feachers/game/entities/game/game.dart';

final gamesRepoProvider = Provider<GamesFetcher>((ref) => GamesFetcherImpl());

abstract class GamesFetcher {
  Future<List<Game>> getGames(
    City city, {
    int limit = AppConsts.itemsPerBatch,
    int offset = 0,
  });

  /// В случае успешного создания
  /// возвращает только что созданную Game
}

class GamesFetcherImpl implements GamesFetcher {
  final _gamesRef = FirebaseFirestore.instance.collection('games');

  final List<DocumentSnapshot> _fetchedDocuments = [];

  @override
  Future<List<Game>> getGames(
    City city, {
    int limit = AppConsts.itemsPerBatch,
    int offset = 0,
  }) async {
    try {
      final query = _formatQuery(city, limit: limit, offset: offset);

      final snapshot = await query.limit(limit).get();
      final docs = snapshot.docs;
      _fetchedDocuments.addAll(docs);

      final games = docs.map((e) => GameMapper.fromApi(e.data())).toList();

      return games;
    } catch (e) {
      rethrow;
    }
  }

  Query<Map<String, dynamic>> _formatQuery(
    City city, {
    required int limit,
    required int offset,
  }) {
    final now = DateTime.now();
    final query = _gamesRef
        .orderBy(FirebaseFields.dateTime)
        .where(FirebaseFields.city, isEqualTo: city.postcode)
        .where(FirebaseFields.dateTime, isGreaterThanOrEqualTo: now);
    if (offset == 0) return query;

    final lastDocument = _getDocByOffset(offset);
    return query.startAfterDocument(lastDocument);
  }

  DocumentSnapshot _getDocByOffset(int offset) {
    final doc = _fetchedDocuments.tryAtIndex(offset - 1);
    if (doc == null) {
      throw CustomException(
        message:
            '[GamesRepo]: Не удается получить документ для пагинации по индексу',
      );
    }
    return doc;
  }
}
