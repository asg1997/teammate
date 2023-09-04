import 'package:freezed_annotation/freezed_annotation.dart';
part 'nickname_state.freezed.dart';

@freezed
abstract class NicknameState with _$NicknameState {
  const factory NicknameState.loading() = _LoadingState;
  const factory NicknameState.initial() = _InitialState;
  const factory NicknameState.success(String nickname) = _SuccessState;
  const factory NicknameState.error(String error) = _ErrorState;
}
