// ignore_for_file: one_member_abstracts

import 'package:riverpod/riverpod.dart';
import 'package:teammate/feachers/players/domain/entities/player.dart';

final shareRepoProvider =
    Provider.autoDispose<ShareRepo>((_) => ShareRepoImpl());
typedef PlayersIds = List<PlayerId>;

abstract class ShareRepo {
  Future<void> share(PlayersIds playersIds);
}

class ShareRepoImpl implements ShareRepo {
  @override
  Future<void> share(PlayersIds playersIds) async {
    print(playersIds);
    // TODO: implement share
  }
}
