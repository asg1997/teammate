import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:teammate/feachers/game/entities/game/game.dart';
import 'package:teammate/service/date_extension.dart';
import 'package:teammate/service/dynamic_links_generator.dart';

final shareProvider =
    FutureProvider.autoDispose.family<void, Game>((ref, game) async {
  final gameStr = game.sport.locale.toLowerCase();
  final whenStr = game.dateTime.toDateAndTimeString;

  final linkToApp = DynamicLinkGenerator().generate();

  await Share.share(
    'Сыграем $whenStr в $gameStr? Присоединяйся! \n$linkToApp',
  );
});
