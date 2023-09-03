import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/core/field/field.dart';
import 'package:teammate/feachers/cities/entities/city.dart';
import 'package:teammate/feachers/game/entities/sport.dart';
import 'package:teammate/feachers/game/presentation/create_game/models/create_game_model.dart';

class CreateGameFormNotifier extends StateNotifier<CreateGameModel> {
  CreateGameFormNotifier(super._state);

  void setCity(City value) {
    state = state.copyWith(city: value);
  }

  void setSport(Sport value) {
    state = state.copyWith(sport: value);
  }

  void setDescription(String value) {
    state = state.copyWith(description: Field(value: value));
  }

  void setDateTime(DateTime value) {
    state = state.copyWith(dateTime: value);
  }

  void setLocation(String value) {
    state = state.copyWith(location: Field(value: value));
  }
}
