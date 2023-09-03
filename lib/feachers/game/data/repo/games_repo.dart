import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/auth/data/session_data.dart';
import 'package:teammate/feachers/cities/entities/city.dart';
import 'package:teammate/feachers/game/data/mapper/game_mapper.dart';
import 'package:teammate/feachers/game/entities/create_game_params.dart';
import 'package:teammate/feachers/game/entities/game.dart';

final gamesRepoProvider = Provider<GamesRepo>((ref) => GamesRepoImpl());

abstract class GamesRepo {
  Future<List<Game>> getGames(City city, {int limit = 10});

  /// В случае успешного создания
  /// возвращает только что созданную Game
  Future<Game> createGame(CreateGameParams params);
  Future<void> delete(Game game);
}

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
  Future<Game> createGame(CreateGameParams params) async {
    try {
      final userId = SessionData().userId;
      final game = Game(
        id: Game.generateDateBasedId(params.dateTime),
        creatorId: userId,
        cityCode: params.city.postcode,
        sport: params.sport,
        location: params.location,
        description: params.description,
        dateTime: params.dateTime,
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
