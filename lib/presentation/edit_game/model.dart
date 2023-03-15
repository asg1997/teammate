import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/domain/entities/game/game.dart';
import 'package:teammate/domain/repos/game_repo.dart';

class EditGameScreenModel extends ChangeNotifier {
  EditGameScreenModel({
    required this.gameId,
    required this.gameRepo,
  }) {
    _init();
  }
  final String gameId;
  final GameRepo gameRepo;

  bool get isLoading => _isLoading;
  Game? get game => _game;

  bool _isLoading = false;
  Game? _game;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set game(Game? value) {
    _game = value;
    notifyListeners();
  }

  Future<void> _init() async {
    isLoading = true;
    game = await gameRepo.getGame(id: gameId);
    isLoading = false;
  }

  void changeName(String value) {
    game = game?.copyWith(gameInfo: game?.gameInfo.copyWith(name: value));
  }

  void changeDateTime(DateTime value) {
    game = game?.copyWith(gameInfo: game?.gameInfo.copyWith(dateTime: value));
  }

  void changeLocation(String value) {
    game = game?.copyWith(gameInfo: game?.gameInfo.copyWith(location: value));
  }

  void changePrice(String value) {
    game = game?.copyWith(gameInfo: game?.gameInfo.copyWith(price: value));
  }

  Future<void> onSaveTapped() async {
    if (game == null) return;
    try {
      isLoading = true;
      await gameRepo.editGame(gameInfo: game!.gameInfo, id: game!.id);
      navigatorKey.currentState?.pop();
    } catch (e) {
      isLoading = false;
      await Fluttertoast.showToast(
        msg: 'Не удается сохранить игру, попробуйте позже',
      );
    }
  }

  Future<void> onDeleteTapped() async {
    if (game == null) return;
    try {
      isLoading = true;
      await gameRepo.deleteGame(id: game!.id);
      navigatorKey.currentState?.pop();
    } catch (e) {
      isLoading = false;
      await Fluttertoast.showToast(
        msg: 'Не удается удалить игру, попробуйте позже',
      );
    }
  }
}
