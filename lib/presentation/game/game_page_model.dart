import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/data/session_data.dart';
import 'package:teammate/domain/repos/games_repo.dart';
import 'package:teammate/domain/repos/players_repo.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/models/user.dart';
import 'package:teammate/service/date_extension.dart';
import 'package:teammate/service/dynamic_links_generator.dart';

class GamePageModel extends ChangeNotifier {
  GamePageModel({
    required this.game,
    required this.gamesRepo,
    required this.playersRepo,
  }) {
    _init();
  }
  final Game game;
  final GamesRepo gamesRepo;
  final PlayersRepo playersRepo;

  bool loadingPlayers = false;
  void _setLoadingPlayers(bool value) {
    loadingPlayers = value;
    notifyListeners();
  }

  bool get isJoin {
    if (game.isMy) return true;
    final isAmoundPlayers = players.firstWhereOrNull(
          (element) => element.id == SessionData().userId,
        ) !=
        null;

    return isAmoundPlayers;
  }

  List<Player> players = [];

  Future<void> _init() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _setLoadingPlayers(true);
      players = await playersRepo.getPlayers(game.id);
      _setLoadingPlayers(false);
    });
  }

  Future<void> onInviteUsersTapped() async {
    final gameStr = game.sport.locale.toLowerCase();
    final whenStr = game.dateTime.toDateAndTimeString;

    final linkToApp = DynamicLinkGenerator().generate();

    await Share.share(
      'Сыграем $whenStr в $gameStr? Присоединяйся! \n$linkToApp',
    );
  }

  Future<void> onDeleteTapped() async {
    await gamesRepo.delete(game);
    navigatorKey.currentState?.pop();
  }

  Future<void> onJoinTapped() async {
    final currentUser = SessionData().currentUser;
    isJoin ? players.remove(currentUser) : players.add(currentUser);
    notifyListeners();
  }
}
