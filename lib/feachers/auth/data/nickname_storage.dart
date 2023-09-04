import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/auth/data/local_storage.dart';
import 'package:teammate/feachers/auth/data/session_data.dart';

import 'package:teammate/feachers/game/data/mapper/player_mapper.dart';
import 'package:teammate/feachers/players/domain/entities/player.dart';

final nicknameStorageProvider = Provider<NicknameStorage>(
  (ref) => CurrentUserRepoImpl(localStorage: ref.read(localStorageProvider)),
);

abstract class NicknameStorage {
  Future<void> saveUser(String nickname);
  Future<String?> getNickname();
}

class CurrentUserRepoImpl implements NicknameStorage {
  CurrentUserRepoImpl({
    required this.localStorage,
  });
  final LocalStorage localStorage;

  static const _nickname = 'nickname';
  final ref = FirebaseFirestore.instance.collection('users');

  @override
  Future<String?> getNickname() => localStorage.getString(_nickname);

  @override
  Future<void> saveUser(String nickname) async {
    final player = Player(
      nickname: nickname,
      id: SessionData.userId,
    );
    final json = UserMapper.toApi(player);
    await ref.doc(player.id).set(json);

    await localStorage.saveString(nickname, _nickname);
  }
}
