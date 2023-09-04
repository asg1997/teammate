import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/consts/firebase_consts.dart';
import 'package:teammate/core/exceptions/custom_exception.dart';
import 'package:teammate/feachers/auth/data/session_data.dart';
import 'package:teammate/feachers/game/data/mapper/player_mapper.dart';
import 'package:teammate/feachers/game/entities/game.dart';

import 'package:teammate/feachers/players/domain/entities/player.dart';

final playersRepoProvider = Provider<PlayersRepo>((ref) => PlayersRepoImpl());

class NoGameFoundException extends CustomExeption {}

abstract class PlayersRepo {
  Stream<List<Player>> getPlayersForGame(GameId gameId);
  Future<void> joinGame(Game game);
  Future<void> quitGame(Game game);

  Future<void> close();
}

class PlayersRepoImpl implements PlayersRepo {
  final _ref = FirebaseFirestore.instance.collection(FirebaseCollections.games);

  // StreamSubscription? _onPlayersUpdateSubscription;

  @override
  Future<void> joinGame(Game game) async {
    final currentUser = _currentUserToApi();
    await _ref.doc(game.id).set(
      {
        'players': FieldValue.arrayUnion([currentUser]),
      },
      SetOptions(merge: true),
    );
  }

  @override
  Future<void> quitGame(Game game) async {
    final currentUser = _currentUserToApi();
    await _ref.doc(game.id).set(
      {
        'players': FieldValue.arrayRemove([currentUser]),
      },
      SetOptions(merge: true),
    );
  }

  Map<String, dynamic> _currentUserToApi() {
    final currentUser = SessionData.currentUser;
    return UserMapper.toApi(currentUser);
  }

  @override
  Stream<List<Player>> getPlayersForGame(GameId gameId) async* {
    await for (final snapshot in _ref.doc(gameId).snapshots()) {
      if (!snapshot.exists || snapshot.data() == null) {
        throw NoGameFoundException();
      }
      final data = snapshot.data()!;
      final players = data['players'] as List<dynamic>;
      yield players
          .map((e) => UserMapper.fromApi(e as Map<String, dynamic>))
          .toList();
    }
  }

  @override
  Future<void> close() async {}
}
