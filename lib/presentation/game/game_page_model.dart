import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:teammate/domain/games_repo.dart';
import 'package:teammate/main.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/service/date_extension.dart';
import 'package:teammate/service/dynamic_links_generator.dart';

class GamePageModel extends ChangeNotifier {
  GamePageModel({
    required this.game,
    required this.gamesRepo,
  });
  final Game game;
  final GamesRepo gamesRepo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
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
    _setLoading(true);
    await gamesRepo.delete(game);
    navigatorKey.currentState?.pop(game);
  }
}
