import 'dart:convert';

import 'package:teammate/core/consts/local_storage_consts.dart';
import 'package:teammate/core/exceptions/custom_exception.dart';
import 'package:teammate/feachers/auth/domain/entities/player.dart';
import 'package:teammate/feachers/auth/domain/repo/local_storage.dart';
import 'package:teammate/feachers/game/data/mapper/player_mapper.dart';
import 'package:teammate/feachers/players/data/mappers/players_mapper.dart';

class NoPlayerInLocalStorageException extends CustomExeption {}

abstract class PlayersLocalStorage {
  /// [NoPlayerInLocalStorageException] в случае ошибки получения игрока
  Future<Player> getPlayer(PlayerId id);
  Future<void> savePlayer(Player player);
}

class PlayersLocalStorageImpl extends PlayersLocalStorage {
  PlayersLocalStorageImpl(this.localStorage);

  final LocalStorage localStorage;

  @override
  Future<Player> getPlayer(PlayerId id) async {
    final json = await localStorage.getString(_key(id));
    if (json == null) throw NoPlayerInLocalStorageException();
    final decoded = jsonDecode(json) as Map<String, dynamic>;
    return UserMapper.fromApi(decoded);
  }

  @override
  Future<void> savePlayer(Player player) async {
    final toEncode = PlayerMapper.toLocal(player);
    final json = jsonEncode(toEncode);
    final key = _key(player.id);
    await localStorage.saveString(json, key);
  }

  String _key(PlayerId id) => '${SharedPrefsKeys.players}_$id';
}
