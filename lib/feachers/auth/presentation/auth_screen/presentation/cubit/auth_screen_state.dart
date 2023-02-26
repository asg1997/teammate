part of 'auth_screen_cubit.dart';

class AuthScreenState extends Equatable {
  final BaseStatus status;
  final String phone;
  final bool isSignedIn;
  final String errorMsg;

  const AuthScreenState({
    required this.status,
    required this.phone,
    required this.isSignedIn,
    required this.errorMsg,
  });

  factory AuthScreenState.initial() => const AuthScreenState(
        status: BaseStatus.loading,
        phone: '',
        isSignedIn: false,
        errorMsg: '',
      );

  @override
  List<Object> get props => [status, phone, isSignedIn, errorMsg];

  AuthScreenState copyWith({
    BaseStatus? status,
    String? phone,
    bool? isSignedIn,
    String? errorMsg,
  }) {
    return AuthScreenState(
        status: status ?? this.status,
        phone: phone ?? this.phone,
        isSignedIn: isSignedIn ?? this.isSignedIn,
        errorMsg: errorMsg ?? this.errorMsg);
  }
}
