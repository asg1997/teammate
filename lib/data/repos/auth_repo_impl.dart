import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teammate/core/exception/custom_exception.dart';
import 'package:teammate/core/exception/firebase_auth_hadler.dart';
import 'package:teammate/core/session_data/session_data.dart';
import 'package:teammate/core/session_data/session_data_service.dart';
import 'package:teammate/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> sendCode({
    required void Function(String error) onError,
    required String phone,
    required VoidCallback onCompleted,
    required void Function(String verificationId, int? forceResendingToken)
        codeSend,
  }) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        // когда проверка завершена, учетные данные для авторизации
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await _signIn(phoneAuthCredential);
          onCompleted();
        },

        // ошибка
        verificationFailed: (error) {
          if (error.message == null) return;
          onError(error.message!);
        },

        // когда код отправляется
        codeSent: codeSend,
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      final mess = FirebaseAuthExceptionHandler.generateMessage(e);
      throw CustomException(message: mess);
    }
  }

  @override
  Future<void> checkCode({
    required String code,
    required String verificationId,
  }) async {
    try {
      await _signIn(
        PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: code,
        ),
      );
    } on FirebaseAuthException catch (e) {
      final mess = FirebaseAuthExceptionHandler.generateMessage(e);
      throw CustomException(message: mess);
    }
  }

  @override
  bool get isAuth => _firebaseAuth.currentUser != null;

  @override
  bool isNewUser = false;

  Future<void> _signIn(AuthCredential credential) async {
    final credentals = await _firebaseAuth.signInWithCredential(credential);

    isNewUser = credentals.additionalUserInfo?.isNewUser ?? true;
    final uid = credentals.user?.uid;
    if (uid == null) return;
    await SessionDataService.saveSessionData(
      SessionData(id: uid),
    );
  }
}
