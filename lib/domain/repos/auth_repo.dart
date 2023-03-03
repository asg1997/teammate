import 'package:flutter/material.dart';

abstract class AuthRepo {
  // отправить код
  Future<void> sendCode({
    required String phone,
    required void Function(String error) onError,
    required VoidCallback onCompleted,
    required void Function(
      String verificationId,
      int? forceResendingToken,
    )
        codeSend,
  });

  // проверить код
  Future<void> checkCode({
    required String code,
    required String verificationId,
  });

  // проверить авторизацию
  bool get isAuth;

  // проверить авторизацию
  late bool isNewUser;
}
