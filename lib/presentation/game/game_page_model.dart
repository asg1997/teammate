import 'package:share_plus/share_plus.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/service/date_extension.dart';

class GamePageModel {
  GamePageModel({
    required this.game,
  });
  final Game game;

  Future<void> onInviteUsersTapped() async {
    final gameStr = game.sport.locale.toLowerCase();
    final whenStr = game.dateTime.toDateAndTimeString;

    await Share.share('Сыграем $whenStr в $gameStr? Присоединяйся!');
  }
}
