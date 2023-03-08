import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/domain/entities/game/game.dart';
import 'package:teammate/domain/repos/games_repo.dart';
import 'package:teammate/services/daytime_to_day.dart';

class GameInfoScreenModel extends ChangeNotifier {
  GameInfoScreenModel({
    required this.gamesRepo,
    required this.game,
  });
  final GamesRepo gamesRepo;
  final Game game;

  String get gameDateStr {
    final time = DateFormat('hh:mm').format(game.gameInfo.dateTime);
    final day = dateTimeToDay(game.gameInfo.dateTime);
    return '$day $time';
  }

  void onInviteUsersTapped() {}

  void onEditTapped(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.editGame);
  }
}
