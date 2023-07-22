import 'package:flutter/material.dart';
import 'package:teammate/data/cities.dart';

import 'package:teammate/domain/notifications_repo.dart';
import 'package:teammate/models/sport.dart';

class NotificationsPageModel extends ChangeNotifier {
  NotificationsPageModel({
    required this.notificationsRepo,
  }) {
    _init();
  }

  final NotificationsRepo notificationsRepo;

  Map<Sport, bool> get sportSettings => _sportSettings;
  final Map<Sport, bool> _sportSettings = {
    Sport.basketball: true,
    Sport.soccer: true,
    Sport.volleyball: true,
  };

  final String _selectedCity = cities.first;
  String get selectedCity => _selectedCity;

  void _init() {}

  void onSportNotificationsChanged(Sport sport, bool value) {
    if (_sportSettings.containsKey(sport)) {
      _sportSettings[sport] = value;
    }
    notifyListeners();
  }
}
