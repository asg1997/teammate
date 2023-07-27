import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teammate/core/consts/firebase_consts.dart';
import 'package:teammate/data/mappers/player_mapper.dart';
import 'package:teammate/data/session_data.dart';
import 'package:teammate/domain/repos/players_repo.dart';
import 'package:teammate/models/game.dart';

class PlayersRepoImpl implements PlayersRepo {
  final _ref =
      FirebaseFirestore.instance.collection(FirebaseConsts.gamesCollection);

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
    final currentUser = SessionData().currentUser;
    return PlayerMapper.toApi(currentUser);
  }
}
