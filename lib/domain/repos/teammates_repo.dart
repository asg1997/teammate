// ignore_for_file: one_member_abstracts

import 'package:teammate/models/player.dart';

abstract class TeammatesRepo {
  // Future<void> addTeammate(Player player);

  Future<List<Player>> getMyTeammates();
}
