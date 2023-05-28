part of 'auth_screen_cubit.dart';

class AuthScreenState extends Equatable {
  const AuthScreenState({
    required this.isRequestingCode,
    required this.isCheckingCode,
    required this.phone,
    required this.isSignedIn,
    required this.otpErrorMsg,
    required this.loginErrorMsg,
  });

  factory AuthScreenState.initial() => const AuthScreenState(
        phone: '',
        isSignedIn: false,
        otpErrorMsg: '',
        isCheckingCode: false,
        isRequestingCode: false,
        loginErrorMsg: '',
      );

  final String phone;
  final bool isRequestingCode;
  final bool isCheckingCode;
  final bool isSignedIn;
  final String otpErrorMsg;
  final String loginErrorMsg;

  String get phoneNoSymbols {
    return '+7${phone.replaceAll(RegExp(r'[()-\s]'), '')}';
  }

  @override
  List<Object> get props => [
        isCheckingCode,
        phone,
        isSignedIn,
        otpErrorMsg,
        isRequestingCode,
      ];

  AuthScreenState copyWith({
    String? phone,
    bool? isRequestingCode,
    bool? isCheckingCode,
    bool? isSignedIn,
    String? otpErrorMsg,
    String? loginErrorMsg,
  }) {
    return AuthScreenState(
      phone: phone ?? this.phone,
      isRequestingCode: isRequestingCode ?? this.isRequestingCode,
      isCheckingCode: isCheckingCode ?? this.isCheckingCode,
      isSignedIn: isSignedIn ?? this.isSignedIn,
      otpErrorMsg: otpErrorMsg ?? this.otpErrorMsg,
      loginErrorMsg: loginErrorMsg ?? this.loginErrorMsg,
    );
  }
}
