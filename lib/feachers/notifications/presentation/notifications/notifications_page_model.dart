// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/feachers/cities/data/city_repo.dart';

import 'package:teammate/feachers/game/entities/sport.dart';
import 'package:teammate/feachers/notifications/data/repo/notifications_repo.dart';

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

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> _init() async {
    _setLoading(true);

    final settings = await notificationsRepo.getSettings();
    if (settings != null) {
      _sportSettings = settings.sport;
    }

    _setLoading(false);
  }

  void onSportNotificationsChanged(Sport sport, bool value) {
    if (_sportSettings.containsKey(sport)) {
      _sportSettings[sport] = value;
    }
    notifyListeners();
  }

  Future<void> onSave() async {
    _setLoading(true);
    try {
      // await notificationsRepo.changeSettings(
      //   NotificationSettings(
      //     sport: _sportSettings,
      //     cityPostcode: _selectedCity.postcode,
      //   ),
      // );
      navigatorKey.currentState?.pop();
    } catch (e) {
      _setLoading(false);
    }
  }
}
