import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:teammate/data/session_data.dart';
import 'package:teammate/domain/repos/cities_repo.dart';
import 'package:teammate/domain/repos/cities_storage.dart';
import 'package:teammate/domain/repos/games_repo.dart';
import 'package:teammate/main.dart';
import 'package:teammate/models/city.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/models/sport.dart';

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
  late City city;
  Sport sport = Sport.soccer;
  String phone = '';
  String description = '';
  DateTime dateTime = DateTime.now();
  String location = '';

  Future<void> _init() async {
    isLoading = true;
    final savedCity = await _cityRepo.getSavedCity();
    city = savedCity ?? CitiesStorage().cities.first;
    isLoading = false;
  }

  void onNameChanged(String value) => _name = value;
  void onCityChanged(City value) => city = value;
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
      await Fluttertoast.showToast(
        msg: 'Не удается создать игру, попробуйте позже',
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  bool _fieldsValid() {
    if (_name.isEmpty && phone.isEmpty && location.isEmpty) {
      Fluttertoast.showToast(msg: 'Заполните все поля *');
      return false;
    }
    return true;
  }

  Future<Game> _getGameFromForm() async {
    final creatorPushToken = SessionData().userId;

    final game = Game(
      name: _name,
      cityCode: city.postcode,
      sport: sport,
      phone: phone,
      description: description,
      creatorId: creatorPushToken,
      dateTime: dateTime,
      location: location,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    return game;
  }

  Future<void> _createGame(Game game) => _gamesRepo.createGame(game);
}
