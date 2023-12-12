import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/auth/data/session_data.dart';
import 'package:teammate/feachers/game/data/mapper/game_mapper.dart';
import 'package:teammate/feachers/game/entities/create_game_params.dart';
import 'package:teammate/feachers/game/entities/game/game.dart';

final gamesCreatorProvider = Provider<GameCreator>((ref) => GameCreatorImpl());

abstract class GameCreator {
  Future<Game> createGame(CreateGameParams params);
}

class GameCreatorImpl implements GameCreator {
  final _gamesRef = FirebaseFirestore.instance.collection('games');

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
      final json = GameMapper.toApi(game);
      await _gamesRef.doc(game.id).set(json);
      return game;
    } catch (e) {
      rethrow;
    }
  }
}
