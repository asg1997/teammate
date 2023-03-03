import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  // контроль входа
  AuthProvider() {
    checkSign();
  }
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  // проверка на авторизован или нет
  Future<void> checkSign() async {
    final s = await SharedPreferences.getInstance();
    // проверяем имеется такой пользователь или нет
    _isSignedIn = s.getBool('is_signedin') ?? false;
    notifyListeners();
  }
}
