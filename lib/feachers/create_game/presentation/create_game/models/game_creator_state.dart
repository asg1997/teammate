import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teammate/feachers/game/entities/game.dart';
part 'game_creator_state.freezed.dart';

@freezed
abstract class GameCreatorState with _$GameCreatorState {
  const factory GameCreatorState.initial() = _InitialState;
  const factory GameCreatorState.success(Game game) = _SuccessState;
  const factory GameCreatorState.loading() = _LoadingState;
  const factory GameCreatorState.error(String msg) = _ErrorState;
}
