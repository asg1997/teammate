import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:teammate/data/cities.dart';
import 'package:teammate/domain/cities_repo.dart';
import 'package:teammate/domain/games_repo.dart';
import 'package:teammate/main.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/models/sport.dart';
import 'package:teammate/service/notifications_service.dart';

class CreateGameModel extends ChangeNotifier {
  CreateGameModel(CityRepo cityRepo, GamesRepo gamesRepo)
      : _cityRepo = cityRepo,
        _gamesRepo = gamesRepo {
    _init();
  }

  final GamesRepo _gamesRepo;
  final CityRepo _cityRepo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  final dateTextController = TextEditingController();

  String _name = '';
  late String city;
  Sport sport = Sport.soccer;
  String phone = '';
  String description = '';
  DateTime dateTime = DateTime.now();
  String location = '';

  void _init() async {
    isLoading = true;
    city = await _cityRepo.getSavedCity() ?? cities.first;
    isLoading = false;
  }

  void onNameChanged(String value) => _name = value;
  void onCityChanged(String value) => city = value;
  void onSportChanged(Sport value) => sport = value;
  void onPhoneChanged(String value) => phone = value;
  void onDescriptionChanged(String value) => description = value;
  void onDateTimeChanged(DateTime value) {
    dateTime = value;
    dateTextController.text = DateFormat('dd MMMM HH:mm', 'ru').format(value);
    notifyListeners();
  }

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
    final creatorPushToken = await NotificationsService().getDeviceToken();

    var game = Game(
      name: _name,
      city: city,
      sport: sport,
      phone: phone,
      description: description,
      creatorPushToken: creatorPushToken,
      dateTime: dateTime,
      location: location,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    return game;
  }

  Future<void> _createGame(Game game) => _gamesRepo.createGame(game);
}
