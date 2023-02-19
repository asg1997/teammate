part of 'registration_info_screen_cubit.dart';

class RegistrationInfoScreenState extends Equatable {
  final BaseStatus status;
  final String name;
  final String nick;
  final DateTime dateTime;
  final String gender;
  final String city;
  const RegistrationInfoScreenState({
    required this.status,
    required this.name,
    required this.nick,
    required this.dateTime,
    required this.gender,
    required this.city,
  });

  factory RegistrationInfoScreenState.initial() => RegistrationInfoScreenState(
      status: BaseStatus.loaded,
      name: '',
      nick: '',
      dateTime: DateTime.now(),
      gender: '',
      city: '');

  @override
  List<Object> get props => [
        status,
        name,
        nick,
        dateTime,
        gender,
        city,
      ];

  RegistrationInfoScreenState copyWith({
    BaseStatus? status,
    String? name,
    String? nick,
    DateTime? dateTime,
    String? gender,
    String? city,
  }) {
    return RegistrationInfoScreenState(
      status: status ?? this.status,
      name: name ?? this.name,
      nick: nick ?? this.nick,
      dateTime: dateTime ?? this.dateTime,
      gender: gender ?? this.gender,
      city: city ?? this.city,
    );
  }
}
