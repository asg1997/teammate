import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_config_state.freezed.dart';

@freezed
class AppConfigState with _$AppConfigState {
  const factory AppConfigState.loading() = _LoadingAppConfigState;
  const factory AppConfigState.loggedIn() = _LogInAppConfigState;
  const factory AppConfigState.loggedOut() = _LogOutAppConfigState;
}
