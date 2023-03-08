import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/session_data/session_data_service.dart';
import 'package:teammate/domain/repos/registration_repo.dart';

enum AuthStatus {
  // авторизирован и зареган
  isAuth,
  // не авторизирован
  isNotAuth,
  // авт-н, но не зареган
  isNotRegistered,
  // статус загружается
  loading,
}

class AuthStatusCubit extends Cubit<AuthStatus> {
  // контроль входа
  AuthStatusCubit({required this.registrationRepo}) : super(AuthStatus.loading);

  final RegistrationRepo registrationRepo;

  AuthStatus _authStatus = AuthStatus.isNotAuth;
  AuthStatus get authStatus => _authStatus;

  set authStatus(AuthStatus value) {
    _authStatus = value;
    emit(value);
  }

  // проверка на авторизован или нет
  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 1), () {});
    if (!SessionDataService.isAuth) {
      authStatus = AuthStatus.isNotAuth;
      return;
    }
    final isRegistered = await registrationRepo.isRegistered;
    authStatus = isRegistered ? AuthStatus.isAuth : AuthStatus.isNotRegistered;
  }
}
