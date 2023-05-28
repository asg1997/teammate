part of 'settings_screen_cubit.dart';

class SettingsScreenState extends Equatable {
  const SettingsScreenState({
    required this.nickname,
    required this.city,
    required this.status,
  });

  factory SettingsScreenState.initial() => SettingsScreenState(
        nickname: '',
        city: City(name: '', region: ''),
        status: BaseStatus.loading,
      );
  final String nickname;
  final City city;
  final BaseStatus status;

  @override
  List<Object> get props => [nickname, city, status];

  SettingsScreenState copyWith({
    String? nickname,
    City? city,
    BaseStatus? status,
  }) {
    return SettingsScreenState(
      nickname: nickname ?? this.nickname,
      city: city ?? this.city,
      status: status ?? this.status,
    );
  }
}
