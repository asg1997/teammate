// ignore_for_file: one_member_abstracts

import 'package:teammate/models/user.dart';

abstract class PlayersRepo {
  Future<List<Player>> getPlayers(String gameId);
}
