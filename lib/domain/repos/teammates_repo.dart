// ignore_for_file: one_member_abstracts

import 'package:teammate/feachers/auth/domain/entities/player.dart';

abstract class TeammatesRepo {
  // Future<void> addTeammate(Player player);

  Future<List<Player>> getMyTeammates();
}
