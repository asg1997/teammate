import 'package:flutter/material.dart';
import 'package:teammate/data/city_repo.dart';
import 'package:teammate/data/games_repo.dart';
import 'package:teammate/main.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/presentation/create_game/create_game_page.dart';

class GamesPageModel extends ChangeNotifier {
  GamesPageModel() {
    _init();
  }

  final _gamesRepo = GamesRepo();
  final _cityRepo = CityRepo();
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
    final saved = await _cityRepo.getSavedCity();
    if (saved != null) onCityChanged(saved);
  }

  Future<void> loadGames() async {
    isLoading = true;

    games = await _gamesRepo.getGames(_selectedCity);
    isLoading = false;
  }

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
