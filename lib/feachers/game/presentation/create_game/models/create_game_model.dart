import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:teammate/core/field/field.dart';
import 'package:teammate/feachers/cities/entities/city.dart';
import 'package:teammate/feachers/game/entities/sport.dart';

part 'create_game_model.freezed.dart';

@freezed
class CreateGameModel with _$CreateGameModel {
  const factory CreateGameModel({
    required City city,
    required Field location,
    required Sport sport,
    required Field description,
    required DateTime dateTime,
  }) = _CreateGameModel;
  const CreateGameModel._();

  bool get filled => location.value.isNotEmpty && description.value.isNotEmpty;
}
