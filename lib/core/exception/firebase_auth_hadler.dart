import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthExceptionHandler {
  static String? generateMessage(
    FirebaseAuthException firebaseExceptionMessage,
  ) {
    switch (firebaseExceptionMessage.code) {
      case 'invalid-credential:':
        return 'Неверные данные';
      case 'user-disabled:':
        return 'Пользователь отключен';

      case 'invalid-verification-code':
        return 'Неверный код подтверждения';
      default:
        return firebaseExceptionMessage.message ?? 'Неизвестная ошибка';
    }
  }
}
