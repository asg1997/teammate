import 'package:freezed_annotation/freezed_annotation.dart';
part 'state.freezed.dart';

@freezed
abstract class DeleteGameState with _$DeleteGameState {
  const factory DeleteGameState.initial() = _InitialDeleteGameState;
  const factory DeleteGameState.deleting() = _DeletingDeleteGameState;
  const factory DeleteGameState.success() = _SuccessDeleteGameState;
}
