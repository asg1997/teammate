import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/game/data/repo/share_repo.dart';
import 'package:teammate/feachers/players/data/datasource/players_local_storage.dart';
import 'package:teammate/feachers/players/data/datasource/players_remote_storage.dart';
import 'package:teammate/feachers/players/domain/entities/player.dart';

final teammatesRepoProvider = Provider<PlayersStorage>(
  (ref) => PlayersStorageImpl(
    localStorage: ref.read(playersLocalStorageProvider),
    remoteStorage: ref.read(playersRemoteStorageProvider),
  ),
);

typedef Players = List<Player>;

abstract class PlayersStorage {
  // Future<void> addTeammate(Player player);

  Future<List<Player>> getMyTeammates();
}

class PlayersStorageImpl implements PlayersStorage {
  PlayersStorageImpl({
    required PlayersLocalStorage localStorage,
    required PlayersRemoteStorage remoteStorage,
  })  : _localStorage = localStorage,
        _remoteStorage = remoteStorage;

  final PlayersLocalStorage _localStorage;
  final PlayersRemoteStorage _remoteStorage;

  // пагинация тут не нужно, сразу получает все документы
  @override
  Future<Players> getMyTeammates() async {
    final allPlayersIds = await _remoteStorage.getMyTeammatesIds();

    final localPlayers = await _getLocal(allPlayersIds);

    final localIds = _idsFromPlayers(localPlayers);
    final idsToGetFromRemote = _remainValuesThanAreNotRecievedLocally(
      localIds,
      allPlayersIds,
    );

    final remotePlayers = await _getRemoteAndSave(idsToGetFromRemote);
    return [...localPlayers, ...remotePlayers];
  }

  Future<Players> _getLocal(PlayersIds ids) async {
    final players = <Player>[];
    for (final id in ids) {
      try {
        final player = await _localStorage.getPlayer(id);
        players.add(player);
      } on NoPlayerInLocalStorageException {
        continue;
      }
    }
    return players;
  }

  PlayersIds _idsFromPlayers(Players players) =>
      players.map((e) => e.id).toList();

  /// нужно извлечь изначения, которых нет в списке
  PlayersIds _remainValuesThanAreNotRecievedLocally(
    PlayersIds localIds,
    PlayersIds allIds,
  ) =>
      localIds.remainNonDublicateValues(allIds).toList();

  Future<Players> _getRemoteAndSave(PlayersIds ids) async {
    final players = await _remoteStorage.getPlayers(ids);
    await _saveTeammates(players);

    return players;
  }

  Future<void> _saveTeammates(Players players) async {
    for (final player in players) {
      await _localStorage.savePlayer(player);
    }
  }
  // @override
  // Future<void> addTeammate(Player player) async {
  //   final myId = SessionData().userId;
  //   final playerJson = TeammatesMapper.toApi(player);
  //   await _ref.doc(myId).set(
  //     {
  //       'teammates': FieldValue.arrayRemove([playerJson])
  //     },
  //     SetOptions(merge: true),
  //   );
  // }
}

/// final arr1 = [1, 2, 3, 4, 5];
/// final arr2 = [1, 2, 5]
// final nonDubls = arr1.remainNonDublicateValues(arr2); // [3, 4]
extension ExtractMissingValues<T> on Iterable<T> {
  Iterable<T> remainNonDublicateValues(Iterable<T> arr) {
    final result = <T>[];
    for (final n in this) {
      if (!arr.contains(n)) result.add(n);
    }
    return result;
  }
}
