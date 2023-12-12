// ignore_for_file: one_member_abstracts

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/consts/firebase_consts.dart';
import 'package:teammate/feachers/game/data/mapper/player_mapper.dart';
import 'package:teammate/feachers/game/data/share_repo.dart';
import 'package:teammate/feachers/players/domain/entities/player.dart';

final playersRemoteStorageProvider = Provider<PlayersRemoteStorage>(
  (ref) => PlayersRemoteStorageImpl(),
);

abstract class PlayersRemoteStorage {
  Future<PlayersIds> getMyTeammatesIds();
  Future<List<Player>> getPlayers(PlayersIds ids);
}

class PlayersRemoteStorageImpl implements PlayersRemoteStorage {
  final _playersRef =
      FirebaseFirestore.instance.collection(FirebaseCollections.players);

  /// Пагинация тут не нужна, выдаст сразу всех пользователей,
  /// потому что я не делаю запрос на насколько документов,
  /// а читаю один документ.
  /// Храню в БД я только id teammates, потому что при
  /// добавлении о пользователе будет сохраняться только id
  // TODO: Протестировать
  @override
  Future<PlayersIds> getMyTeammatesIds() async {
    // final myId = SessionData().userId;
    // final query = _teammatesRef.doc(myId);

    // final snapshot = await query.get();
    // if (!snapshot.exists) return [];

    // final data = snapshot.data()!;
    // final ids = _parse(data);
    // return ids;
    throw UnimplementedError();
  }

  PlayersIds _parse(Map<String, dynamic> data) {
    final json = data['teammates'] as List<dynamic>?;
    if (json == null || json.isEmpty) return [];
    return json.map((e) => e as PlayerId).toList();
  }

  /// FIXME: что с пагинацией делать?
  // TODO: Test
  /// у вот тут пагинация нужна
  @override
  Future<List<Player>> getPlayers(PlayersIds ids) async {
    final query = _playersRef.where(FirebaseFields.id, whereIn: ids);
    final snapshot = await query.get();

    final docs = snapshot.docs;
    final players = <Player>[];
    for (final doc in docs) {
      if (!doc.exists) continue;
      final player = UserMapper.fromApi(doc.data());
      players.add(player);
    }
    return players;
  }
}
