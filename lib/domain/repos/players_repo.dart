// ignore_for_file: one_member_abstracts

import 'package:teammate/models/game.dart';

abstract class PlayersRepo {
  Future<void> joinGame(Game game);
  Future<void> quitGame(Game game);
}
