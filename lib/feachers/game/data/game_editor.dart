import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/consts/firebase_consts.dart';
import 'package:teammate/core/exceptions/custom_exception.dart';
import 'package:teammate/feachers/game/data/models/update_game_params.dart';
import 'package:teammate/feachers/game/entities/game/game.dart';

final gamesEditorProvider = Provider<GameEditor>((ref) => GameEditorImpl());

abstract class GameEditor {
  Future<void> editGame(GameId gameId, {required UpdateGameParams params});
  Future<void> deleteGame(GameId gameId);
}

class GameEditorImpl implements GameEditor {
  final _gamesRef = FirebaseFirestore.instance.collection('games');

  @override
  Future<void> deleteGame(GameId gameId) async {
    try {
      await _gamesRef.doc(gameId).delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> editGame(
    GameId gameId, {
    required UpdateGameParams params,
  }) async {
    try {
      final fieldsToUpdate = {
        FirebaseFields.dateTime: params.dateTime,
        FirebaseFields.location: params.location,
      }..removeWhere((key, value) => value == null);

      if (fieldsToUpdate.isEmpty) return;
      await _gamesRef.doc(gameId).update(fieldsToUpdate);
    } on FirebaseException catch (e) {
      throw CustomException.fromServer(e);
    }
  }
}
