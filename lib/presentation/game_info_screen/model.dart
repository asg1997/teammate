import 'package:flutter/material.dart';
import 'package:teammate/core/navigation/app_router.dart';

import 'package:teammate/domain/entities/game.dart';
import 'package:teammate/domain/repos/games_repo.dart';

class GameInfoScreenModel extends ChangeNotifier {
  GameInfoScreenModel({
    required this.gamesRepo,
    required this.game,
  });
  final GamesRepo gamesRepo;
  final Game game;

  void onInviteUsersTapped() {}

  void onEditTapped(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.editGame);
  }
}
