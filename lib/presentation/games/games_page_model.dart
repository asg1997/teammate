import 'package:flutter/material.dart';
import 'package:teammate/data/session_data.dart';
import 'package:teammate/domain/cities_repo.dart';
import 'package:teammate/domain/games_repo.dart';
import 'package:teammate/main.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/presentation/create_game/create_game_page.dart';

class GamesPageModel extends ChangeNotifier {
  GamesPageModel({required CityRepo cityRepo, required GamesRepo gamesRepo})
      : _cityRepo = cityRepo,
        _gamesRepo = gamesRepo {
    _init();
  }

  final GamesRepo _gamesRepo;
  final CityRepo _cityRepo;
  final dateTextController = TextEditingController();

  List<Game> games = [];

  var _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String _selectedCity = 'Москва';
  String get selectedCity => _selectedCity;

  Future<void> _init() async {
    isLoading = true;
    await _getSavedCity();
    await loadGames();
    isLoading = false;
  }

  Future<void> _getSavedCity() async {
    final savedCity = await _cityRepo.getSavedCity();

    savedCity == null
        ? await onCityChanged(_selectedCity)
        : await onCityChanged(savedCity);
  }

  Future<void> loadGames() async {
    isLoading = true;
    games = await _gamesRepo.getGames(_selectedCity);

    isLoading = false;
  }

  void onDeleteTapped(Game game) async {
    await _gamesRepo.delete(game);
    games.remove(game);
  }

  bool isMyGame(Game game) => SessionData().userId == game.creatorPushToken;

  void onCreateGame() async {
    final game = await navigatorKey.currentState?.push(
      MaterialPageRoute(
        maintainState: false,
        builder: (_) => CreateGamePage(),
      ),
    ) as Game?;
    if (game != null) _addGame(game);
  }

  void _addGame(Game game) {
    if (game.city == _selectedCity) {
      games.add(game);
      notifyListeners();
    }
  }

  Future<void> onCityChanged(String city) async {
    if (city == _selectedCity) return;
    _selectedCity = city;
    notifyListeners();
    _cityRepo.saveCity(city);
    await loadGames();
  }

  void removeGame(Game game) {
    games.remove(game);
    notifyListeners();
  }
}
