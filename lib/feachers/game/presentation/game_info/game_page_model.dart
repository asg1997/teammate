import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/feachers/auth/data/repo/session_data.dart';
import 'package:teammate/feachers/auth/domain/entities/player.dart';
import 'package:teammate/feachers/game/domain/entities/game.dart';
import 'package:teammate/feachers/game/domain/repo/games_repo.dart';
import 'package:teammate/feachers/game/domain/repo/players_repo.dart';
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

  final Player _currentUser = SessionData().currentUser;
  List<Player> get players => game.players;

  // bool loadingPlayers = false;
  // void _setLoadingPlayers(bool value) {
  //   loadingPlayers = value;
  //   notifyListeners();
  // }

  bool get isJoin {
    if (game.isMy) return true;
    final playersIds = game.players.map((e) => e.id).toList();
    final myId = SessionData().userId;
    return playersIds.contains(myId);
  }

  Future<void> _init() async {}

  Future<void> onShareTapped() async {
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
    isJoin ? await _quitGame() : await _joinGame();

    notifyListeners();
  }

  Future<void> _joinGame() async {
    await playersRepo.joinGame(game);
    game.players.add(_currentUser);
  }

  Future<void> _quitGame() async {
    await playersRepo.quitGame(game);
    game.players.remove(_currentUser);
  }
}
