import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_game_params.freezed.dart';

@freezed
class UpdateGameParams with _$UpdateGameParams {
  const factory UpdateGameParams({
    required DateTime? dateTime,
    required String? location,
    required String? name,
    required String? description,
  }) = _UpdateGameParams;
  const UpdateGameParams._();

  bool get isEmpty =>
      dateTime == null &&
      location == null &&
      name == null &&
      description == null;
}
