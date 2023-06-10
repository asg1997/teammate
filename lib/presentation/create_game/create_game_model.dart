import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:teammate/data/games_repo.dart';
import 'package:teammate/data/session_data.dart';
import 'package:teammate/main.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/models/sport.dart';

class CreateGameModel extends ChangeNotifier {
  CreateGameModel();
  final _gamesRepo = GamesRepo();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _name = '';
  String city = '';
  Sport sport = Sport.soccer;
  String phone = '';
  String description = '';
  DateTime dateTime = DateTime.now();
  String location = '';

  void onNameChanged(String value) => _name = value;
  void onCityChanged(String value) => city = value;
  void onSportChanged(Sport value) => sport = value;
  void onPhoneChanged(String value) => phone = value;
  void onDescriptionChanged(String value) => description = value;
  void onDateTimeChanged(DateTime value) => dateTime = value;
  void onLocationChanged(String value) => location = value;

  Future<void> onCreateGameTapped() async {
    final fieldsValid = _fieldsValid();
    if (!fieldsValid) return;

    _isLoading = true;
    notifyListeners();
    try {
      final game = await _getGameFromForm();
      await _createGame(game);
      navigatorKey.currentState?.pop(game);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Не удается создать игру, попробуйте позже');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  bool _fieldsValid() {
    if (_name.isEmpty && city.isEmpty && phone.isEmpty && location.isEmpty) {
      Fluttertoast.showToast(msg: 'Заполните все поля *');
      return false;
    }
    return true;
  }

  Future<Game> _getGameFromForm() async {
    final userId = SessionData().userId;

    var game = Game(
      name: _name,
      city: city,
      sport: sport,
      phone: phone,
      description: description,
      creatorId: userId,
      dateTime: dateTime,
      location: location,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    return game;
  }

  Future<void> _createGame(Game game) async {
    _gamesRepo.createGame(game);
  }
}
