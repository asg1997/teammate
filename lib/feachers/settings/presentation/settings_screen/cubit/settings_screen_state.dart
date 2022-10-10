part of 'settings_screen_cubit.dart';

class SettingsScreenState extends Equatable {
  final String nickname;
  final String city;
  final BaseStatus status;

  const SettingsScreenState({
    required this.nickname,
    required this.city,
    required this.status,
  });

  factory SettingsScreenState.initial() => const SettingsScreenState(
        nickname: '',
        city: '',
        status: BaseStatus.loading,
      );

  @override
  List<Object> get props => [nickname, city, status];

  SettingsScreenState copyWith({
    String? nickname,
    String? city,
    BaseStatus? status,
  }) {
    return SettingsScreenState(
      nickname: nickname ?? this.nickname,
      city: city ?? this.city,
      status: status ?? this.status,
    );
  }
}
