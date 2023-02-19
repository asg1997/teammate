part of 'auth_screen_cubit.dart';

class AuthScreenState extends Equatable {
  final BaseStatus status;
  final String email;
  final String password;
  const AuthScreenState({
    required this.status,
    required this.email,
    required this.password,
  });

  factory AuthScreenState.initial() => const AuthScreenState(
      status: BaseStatus.loading, email: '', password: '');

  @override
  List<Object> get props => [
        status,
        email,
        password,
      ];

  AuthScreenState copyWith({
    BaseStatus? status,
    String? email,
    String? password,
  }) {
    return AuthScreenState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
