import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teammate/feachers/cities/entities/city.dart';
import 'package:teammate/feachers/game/entities/sport.dart';
part 'create_game_params.freezed.dart';

@freezed
class CreateGameParams with _$CreateGameParams {
  const factory CreateGameParams({
    required String location,
    required Sport sport,
    required String description,
    required String name,
    required DateTime dateTime,
    required City city,
  }) = _CreateGameParams;
}
