import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/domain/entities/game/game.dart';
import 'package:teammate/domain/repos/game_repo.dart';
import 'package:teammate/domain/repos/games_repo.dart';
import 'package:teammate/services/daytime_to_day.dart';

class GameInfoScreenModel extends ChangeNotifier {
  GameInfoScreenModel({
    required this.gamesRepo,
    required this.gameRepo,
    required Game game,
  }) : _game = game;
  final GamesRepo gamesRepo;
  final GameRepo gameRepo;

  Game _game;
  bool _isLoading = false;

  Game get game => _game;
  bool get isLoading => _isLoading;

  set game(Game value) {
    _game = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String get gameDateStr {
    final time = DateFormat('hh:mm').format(game.gameInfo.dateTime);
    final day = dateTimeToDay(game.gameInfo.dateTime);
    return '$day $time';
  }

  void onInviteUsersTapped() {}

  Future<void> onEditTapped() async {
    await navigatorKey.currentState
        ?.pushNamed(AppRoutes.editGame, arguments: game.id);
    // TODO: прорисовать загрузку
    isLoading = true;
    game = await gameRepo.getGame(id: game.id);
    isLoading = false;
  }
}
