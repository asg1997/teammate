import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/consts/app_consts.dart';
import 'package:teammate/core/exceptions/custom_exception.dart';
import 'package:teammate/core/extensions/safety_index.dart';
import 'package:teammate/feachers/auth/data/session_data.dart';
import 'package:teammate/feachers/cities/entities/city.dart';
import 'package:teammate/feachers/game/data/mapper/game_mapper.dart';
import 'package:teammate/feachers/game/entities/create_game_params.dart';
import 'package:teammate/feachers/game/entities/game.dart';

final gamesRepoProvider = Provider<GamesRepo>((ref) => GamesRepoImpl());

abstract class GamesRepo {
  Future<List<Game>> getGames(
    City city, {
    int limit = AppConsts.itemsPerBatch,
    int offset = 0,
  });

  /// В случае успешного создания
  /// возвращает только что созданную Game
  Future<Game> createGame(CreateGameParams params);
  Future<void> delete(Game game);
}

class GamesRepoImpl implements GamesRepo {
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
    final nowMilliseconds = DateTime.now().millisecondsSinceEpoch;
    final query = _gamesRef
        .orderBy('dateTime')
        .where('city', isEqualTo: city.postcode)
        .where('dateTime', isGreaterThanOrEqualTo: nowMilliseconds);
    if (offset == 0) return query;

    final lastDocument = _getDocByOffset(offset);
    return query.startAfterDocument(lastDocument);
  }

  DocumentSnapshot _getDocByOffset(int offset) {
    final doc = _fetchedDocuments.tryAtIndex(offset - 1);
    if (doc == null) {
      throw CustomExeption(
        message:
            '[GamesRepo]: Не удается получить документ для пагинации по индексу',
      );
    }
    return doc;
  }

  @override
  Future<Game> createGame(CreateGameParams params) async {
    try {
      final userId = SessionData.userId;
      final game = Game(
        id: Game.generateDateBasedId(params.dateTime),
        creatorId: userId,
        cityCode: params.city.postcode,
        sport: params.sport,
        location: params.location,
        description: params.description,
        dateTime: params.dateTime,
        name: params.name,
      );

      await _gamesRef.doc(game.id).set(GameMapper.toApi(game));
      return game;
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
