import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/feachers/create_game/presentation/create_game/providers/create_game_form_notifier_provider.dart';
import 'package:teammate/feachers/create_game/presentation/create_game/providers/game_creator_notifier_provider.dart';

final createGameProvider = Provider.autoDispose(
  (ref) => ref
      .read(gameCreatorNotifierProvider.notifier)
      .createGame(ref.watch(createGameFormNotifierProvider)),
);
