import 'package:flutter/material.dart';

import 'package:teammate/core/navigation/app_router.dart';
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
    await Navigator.of(context).pushNamed(
      AppRoutes.stepOne,
    );
    await _getGames();
  }

  void onSettingsTapped(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.settings,
    );
  }

  void onSearchTapped(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.searchGame,
    );
  }

  void onGameTapped(BuildContext context, Game game) {
    Navigator.of(context).pushNamed(AppRoutes.gameInfo, arguments: game);
  }
}
