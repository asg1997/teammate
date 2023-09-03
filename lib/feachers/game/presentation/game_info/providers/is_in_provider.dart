import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/auth/data/session_data.dart';
import 'package:teammate/feachers/game/entities/game.dart';

final isInProvider = StateProvider.autoDispose.family<bool, Game>((ref, game) {
  if (game.isMy) return true;
  final myId = SessionData().userId;

  return game.players?.contains(myId) ?? false;
});
