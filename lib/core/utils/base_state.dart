import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teammate/core/exceptions/custom_exception.dart';

part 'base_state.freezed.dart';

@freezed
class BaseState<T> with _$BaseState<T> {
  const factory BaseState.initial() = _InitialBaseState;
  const factory BaseState.loading() = LoadingBaseState;
  const factory BaseState.error(CustomException exception) = _ErrorBaseState;
  const factory BaseState.success({T? data}) = SuccessBaseState;
}
