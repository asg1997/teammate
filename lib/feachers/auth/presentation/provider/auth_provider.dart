import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  // контроль входа
  AuthProvider() {
    checkSign();
  }

  // проверка на авторизован или нет
  void checkSign() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    // проверяем имеется такой пользователь или нет
    _isSignedIn = s.getBool('is_signedin') ?? false;
    notifyListeners();
  }
}
