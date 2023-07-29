import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teammate/data/mappers/player_mapper.dart';
import 'package:teammate/data/session_data.dart';
import 'package:teammate/domain/repos/current_user_repo.dart';
import 'package:teammate/domain/repos/local_storage.dart';
import 'package:teammate/models/player.dart';

// class UserAlreadyExistsException extends CustomExeption {}

class CurrentUserRepoImpl implements CurrentUserRepo {
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
      id: SessionData().userId,
    );
    final json = PlayerMapper.toApi(player);
    await ref.doc(player.id).set(json);

    await localStorage.saveString(nickname, _nickname);
  }
}
