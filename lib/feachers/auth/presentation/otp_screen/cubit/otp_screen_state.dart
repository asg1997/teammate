part of 'otp_screen_cubit.dart';

class OtpScreenState extends Equatable {
  final BaseStatus status;
  final String code;
  const OtpScreenState({
    required this.status,
    required this.code,
  });

  factory OtpScreenState.initial() =>
      const OtpScreenState(status: BaseStatus.loaded, code: '');

  @override
  List<Object> get props => [
        status,
        code,
      ];

  OtpScreenState copyWith({
    BaseStatus? status,
    String? code,
  }) {
    return OtpScreenState(
      status: status ?? this.status,
      code: code ?? this.code,
    );
  }
}
