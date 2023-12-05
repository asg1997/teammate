import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/field/field.dart';
import 'package:teammate/feachers/game/entities/sport.dart';
import 'package:teammate/feachers/game/presentation/create_game/models/create_game_model.dart';
import 'package:teammate/feachers/game/presentation/create_game/notifiers/create_game_form_notifier.dart';
import 'package:teammate/feachers/game/presentation/games/providers/selected_city_provider.dart';

final createGameFormNotifierProvider =
    StateNotifierProvider.autoDispose<CreateGameFormNotifier, CreateGameModel>(
        (ref) {
  final currentCity = ref.watch(selectedCityProvider);
  return CreateGameFormNotifier(
    CreateGameModel(
      location: Field.empty(),
      sport: Sport.soccer,
      description: Field.empty(),
      dateTime: null,
      city: currentCity!,
      name: Field.empty(),
    ),
  );
});
