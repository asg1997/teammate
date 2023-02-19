part of 'registration_screen_cubit.dart';

class RegistrationScreenState extends Equatable {
  final BaseStatus status;
  final String email;
  final String password;
  const RegistrationScreenState({
    required this.status,
    required this.email,
    required this.password,
  });

  factory RegistrationScreenState.initial() => const RegistrationScreenState(
      status: BaseStatus.loaded, email: '', password: '');

  @override
  List<Object> get props => [status, email, password];

  RegistrationScreenState copyWith({
    BaseStatus? status,
    String? email,
    String? password,
  }) {
    return RegistrationScreenState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
