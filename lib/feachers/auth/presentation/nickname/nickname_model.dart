import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/feachers/auth/domain/repo/current_user_repo.dart';

import 'package:teammate/feachers/game/presentation/games/games_page.dart';

class NicknamePageModel extends ChangeNotifier {
  NicknamePageModel({
    required this.nicknameRepo,
  });
  final CurrentUserRepo nicknameRepo;
  String name = '';
  bool isLoading = true;

  Future<void> onSubmit() async {
    if (name.isEmpty) {
      await Fluttertoast.showToast(msg: 'Поле не должно быть путым');
      return;
    }
    isLoading = true;
    notifyListeners();
    await nicknameRepo.saveUser(name);
    isLoading = false;
    notifyListeners();
    await navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute<void>(builder: (_) => const GamesPage()),
      (_) => false,
    );
  }
}
