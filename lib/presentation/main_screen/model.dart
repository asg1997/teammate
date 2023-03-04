import 'package:flutter/material.dart';

import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/domain/entities/game.dart';
import 'package:teammate/domain/repos/games_repo.dart';

class MainScreenModel extends ChangeNotifier {
  MainScreenModel({
    required this.gamesRepo,
  }) {
    _init();
  }

  final GamesRepo gamesRepo;

  List<Game> _games = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<Game> get games => _games;

  set games(List<Game> value) {
    _games = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> _init() async {
    await _getGames();
  }

  Future<void> _getGames() async {
    isLoading = true;
    games = await gamesRepo.getAllUserGames();
    isLoading = false;
  }

  Future<void> onAddGameButtonTapped(BuildContext context) async {
    await navigatorKey.currentState?.pushNamed(
      AppRoutes.stepOne,
    );
    await _getGames();
  }

  void onSettingsTapped(BuildContext context) {
    navigatorKey.currentState?.pushNamed(
      AppRoutes.settings,
    );
  }

  void onSearchTapped(BuildContext context) {
    navigatorKey.currentState?.pushNamed(
      AppRoutes.searchGame,
    );
  }

  void onGameTapped(BuildContext context, Game game) {
    navigatorKey.currentState?.pushNamed(AppRoutes.gameInfo, arguments: game);
  }
}
