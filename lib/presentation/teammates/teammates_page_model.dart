import 'package:flutter/material.dart';
import 'package:teammate/domain/repos/teammates_repo.dart';
import 'package:teammate/models/user.dart';

class TeammatesPageModel extends ChangeNotifier {
  TeammatesPageModel(this.teammatesRepo) {
    _loalTeammates();
  }

  final TeammatesRepo teammatesRepo;

  bool isLoading = false;
  void _onLoadingChanged(bool value) {
    isLoading = value;
    notifyListeners();
  }

  List<Player> players = [];

  Future<void> _loalTeammates() async {
    _onLoadingChanged(true);

    players = await teammatesRepo.getMyTeammates();
    _onLoadingChanged(false);
  }
}
