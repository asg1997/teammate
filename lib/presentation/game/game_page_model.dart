import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:teammate/models/game.dart';
import 'package:teammate/service/date_extension.dart';
import 'package:teammate/service/dynamic_links_generator.dart';

class GamePageModel extends ChangeNotifier {
  GamePageModel({
    required this.game,
  });
  final Game game;

  Future<void> onInviteUsersTapped() async {
    final gameStr = game.sport.locale.toLowerCase();
    final whenStr = game.dateTime.toDateAndTimeString;

    final linkToApp = DynamicLinkGenerator().generate();

    // The text you want to share

    await Share.share(
        'Сыграем $whenStr в $gameStr? Присоединяйся! \n$linkToApp');
  }
}
