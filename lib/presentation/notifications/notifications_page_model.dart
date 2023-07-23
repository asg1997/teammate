import 'package:flutter/material.dart';
import 'package:teammate/domain/repos/cities_repo.dart';
import 'package:teammate/domain/repos/cities_storage.dart';
import 'package:teammate/domain/repos/notifications_repo.dart';
import 'package:teammate/main.dart';
import 'package:teammate/models/city.dart';
import 'package:teammate/models/notification_settings.dart';
import 'package:teammate/models/sport.dart';

class NotificationsPageModel extends ChangeNotifier {
  NotificationsPageModel({
    required this.notificationsRepo,
    required this.cityRepo,
  }) {
    _init();
  }

  final NotificationsRepo notificationsRepo;
  final CityRepo cityRepo;

  Map<Sport, bool> get sportSettings => _sportSettings;
  Map<Sport, bool> _sportSettings = {
    Sport.basketball: true,
    Sport.soccer: true,
    Sport.volleyball: true,
  };

  late var _selectedCity = CitiesStorage().cities.first;
  City get selectedCity => _selectedCity;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _init() async {
    _setLoading(true);

    final settings = await notificationsRepo.getSettings();
    if (settings != null) {
      _selectedCity = CitiesStorage().fromPostcode(settings.cityPostcode);
      _sportSettings = settings.sport;
    }

    _setLoading(false);
  }

  void onCityChanged(City city) {}

  void onSportNotificationsChanged(Sport sport, bool value) {
    if (_sportSettings.containsKey(sport)) {
      _sportSettings[sport] = value;
    }
    notifyListeners();
  }

  void onSave() async {
    _setLoading(true);
    try {
      await notificationsRepo.changeSettings(NotificationSettings(
        sport: _sportSettings,
        cityPostcode: _selectedCity.postcode,
      ));
      navigatorKey.currentState?.pop();
    } catch (e) {
      _setLoading(false);
    }
  }
}