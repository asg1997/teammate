import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teammate/core/session_data/session_data.dart';
import 'package:teammate/core/session_data/session_data_service.dart';
import 'package:teammate/feachers/auth/auth_screen/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> sendCode(
      {required Function(String error) onError,
      required String phone,
      required VoidCallback onCompleted,
      required void Function(String verificationId, int? forceResendingToken)
          codeSend}) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        // когда проверка завершена, учетные данные для авторизации
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          _signIn(phoneAuthCredential);
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
    } on FirebaseAuthException {}
  }

  @override
  Future<void> checkCode(
      {required String code, required String verificationId}) async {
    _signIn(PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: code));
  }

  @override
  bool get isAuth => _firebaseAuth.currentUser != null;

  @override
  bool isNewUser = false;

  void _signIn(AuthCredential credential) async {
    final credentals = await _firebaseAuth.signInWithCredential(credential);

    isNewUser = credentals.additionalUserInfo?.isNewUser ?? true;
    final uid = credentals.user?.uid;
    if (uid == null) return;
    await SessionDataService.saveSessionData(
      SessionData(id: uid),
    );
  }
}
