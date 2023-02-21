part of 'auth_screen_cubit.dart';

class AuthScreenState extends Equatable {
  final BaseStatus status;
  final String phone;
  final bool isSignedIn;

  const AuthScreenState(
      {required this.status, required this.phone, required this.isSignedIn});

  factory AuthScreenState.initial() => const AuthScreenState(
        status: BaseStatus.loading,
        phone: '',
        isSignedIn: false,
      );

  @override
  List<Object> get props => [status, phone, isSignedIn];

  AuthScreenState copyWith({
    BaseStatus? status,
    String? phone,
    bool? isSignedIn,
  }) {
    return AuthScreenState(
      status: status ?? this.status,
      phone: phone ?? this.phone,
      isSignedIn: isSignedIn ?? this.isSignedIn,
    );
  }
}
