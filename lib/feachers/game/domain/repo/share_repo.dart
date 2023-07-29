// ignore_for_file: one_member_abstracts

import 'package:teammate/feachers/auth/domain/entities/player.dart';

typedef PlayersIds = List<PlayerId>;

abstract class ShareRepo {
  Future<void> share(PlayersIds playersIds);
}
