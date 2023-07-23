import 'package:flutter/material.dart';
import 'package:teammate/data/session_data.dart';
import 'package:teammate/domain/repos/cities_storage.dart';
import 'package:teammate/domain/repos/games_repo.dart';
import 'package:teammate/domain/repos/cities_repo.dart';
import 'package:teammate/main.dart';
import 'package:teammate/models/city.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/presentation/create_game/create_game_page.dart';
import 'package:teammate/presentation/game/game_page.dart';
import 'package:teammate/presentation/notifications/notifications_page.dart';
import 'package:collection/collection.dart';

class GamesPageModel extends ChangeNotifier {
  GamesPageModel({required CityRepo cityRepo, required GamesRepo gamesRepo})
      : _cityRepo = cityRepo,
        _gamesRepo = gamesRepo {
    _init();
  }

  final GamesRepo _gamesRepo;
  final CityRepo _cityRepo;
  final dateTextController = TextEditingController();

  List<Game> _games = [];
  List<Game> get games =>
      _games..sort((a, b) => a.dateTime.compareTo(b.dateTime));

  var _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  var _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;
  void _setIsLoadingMore(bool value) {
    _isLoadingMore = value;
    notifyListeners();
  }

  late City? _selectedCity = CitiesStorage().cities.firstOrNull;
  City? get selectedCity => _selectedCity;

  Future<void> _init() async {
    isLoading = true;

    await _initSavedCity();
    await loadGames();
    isLoading = false;
  }

  Future<void> _initSavedCity() async {
    final savedCity = await _cityRepo.getSavedCity();
    if (savedCity != null) {
      _selectedCity = savedCity;
      notifyListeners();
    }
  }

  Future<void> loadGames() async {
    if (_selectedCity == null) return;
    isLoading = true;
    _games = await _gamesRepo.getGames(_selectedCity!);
    isLoading = false;
  }

  Future<void> loadMore() async {
    _setIsLoadingMore(true);
    final newGames = await _gamesRepo.getGames(_selectedCity!);
    _games = [..._games, ...newGames];
    _setIsLoadingMore(false);
  }

  void removeGameFromView(Game game) async {
    _games.remove(game);
    notifyListeners();
  }

  bool isMyGame(Game game) => SessionData().userId == game.creatorId;

  void onCreateGame() async {
    final game = await navigatorKey.currentState?.push(
      MaterialPageRoute(
        maintainState: false,
        builder: (_) => const CreateGamePage(),
      ),
    ) as Game?;
    if (game != null) _addGame(game);
  }

  void _addGame(Game game) {
    if (game.cityCode == _selectedCity?.postcode) {
      games.add(game);
      notifyListeners();
    }
  }

  Future<void> onCityChanged(City city) async {
    if (city == _selectedCity) return;
    _selectedCity = city;
    notifyListeners();
    _cityRepo.saveCity(city);
    await loadGames();
  }

  void removeGame(Game game) {
    _games.remove(game);
    notifyListeners();
  }

  void onGameTap(Game game) => navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (_) => GamePage(game: game),
        ),
      );

  void onNotificationsTap() {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (_) => const NotificationsPage(),
      ),
    );
  }
}
