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

class AuthProviderCubit extends Cubit<AuthStatus> {
  // контроль входа
  AuthProviderCubit({required this.registrationRepo})
      : super(AuthStatus.isNotAuth) {
    _checkSign();
  }

  final RegistrationRepo registrationRepo;

  AuthStatus _authStatus = AuthStatus.isNotAuth;
  AuthStatus get authStatus => _authStatus;

  set authStatus(AuthStatus value) {
    _authStatus = value;
    emit(_authStatus);
  }

  // проверка на авторизован или нет
  Future<void> _checkSign() async {
    if (!SessionDataService.isAuth) {
      authStatus = AuthStatus.isNotAuth;
      return;
    }
    final isRegistered = await registrationRepo.isRegistered;
    authStatus = isRegistered ? AuthStatus.isAuth : AuthStatus.isNotRegistered;
  }
}
