part of 'registration_info_screen_cubit.dart';

class RegistrationInfoScreenState extends Equatable {
  const RegistrationInfoScreenState({
    required this.status,
    required this.name,
    required this.nick,
    required this.dateTime,
    required this.gender,
    required this.city,
    required this.cities,
    required this.errorText,
    required this.isRegistering,
  });

  factory RegistrationInfoScreenState.initial() => RegistrationInfoScreenState(
        status: BaseStatus.loading,
        name: '',
        nick: '',
        dateTime: DateTime.now(),
        gender: '',
        city: City(name: '', region: ''),
        cities: const [],
        errorText: '',
        isRegistering: false,
      );
  final BaseStatus status;
  final String name;
  final String nick;
  final DateTime dateTime;
  final String gender;
  final City city;
  final String errorText;
  final List<City> cities;
  final bool isRegistering;

  @override
  List<Object> get props => [
        status,
        name,
        nick,
        dateTime,
        gender,
        city,
        cities,
        errorText,
        isRegistering,
      ];

  RegistrationInfoScreenState copyWith({
    BaseStatus? status,
    String? name,
    String? nick,
    DateTime? dateTime,
    String? gender,
    City? city,
    String? errorText,
    List<City>? cities,
    bool? isRegistering,
  }) {
    return RegistrationInfoScreenState(
      status: status ?? this.status,
      name: name ?? this.name,
      nick: nick ?? this.nick,
      dateTime: dateTime ?? this.dateTime,
      gender: gender ?? this.gender,
      city: city ?? this.city,
      errorText: errorText ?? this.errorText,
      cities: cities ?? this.cities,
      isRegistering: isRegistering ?? this.isRegistering,
    );
  }
}
