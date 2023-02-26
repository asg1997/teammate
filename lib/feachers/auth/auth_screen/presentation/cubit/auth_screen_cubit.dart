// ignore_for_file: use_build_context_synchronously
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:teammate/core/bloc_utils/base_status.dart';
import 'package:teammate/core/exception/firebase_auth_hadler.dart';
import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/feachers/auth/auth_screen/domain/repo/auth_repo.dart';

part 'auth_screen_state.dart';

class AuthScreenCubit extends Cubit<AuthScreenState> {
  AuthScreenCubit({required this.authRepo}) : super(AuthScreenState.initial());

  final AuthRepo authRepo;
  String? _verificationId;

  void onPhoneChanged(String phone) {
    emit(state.copyWith(phone: phone));
  }

  void onOtpScreen(BuildContext context) async {
    if (state.phone.length != 10) {
      emit(state.copyWith(
          status: BaseStatus.error, errorMsg: 'Неправильно введен номер'));
      return;
    }

    await authRepo.sendCode(
      onError: (error) => Fluttertoast.showToast(msg: error),
      onCompleted: () {
        // авторизован или нет
        authRepo.isNewUser
            ? Navigator.of(context).pushNamed(
                AppRoutes.registrationInfo,
              )
            : Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.main,
                (_) => false,
              );
      },
      phone: '+7${state.phone}',
      codeSend: (String verificationId, int? forceResendingToken) {
        _verificationId = verificationId;
        Navigator.of(context).pushNamed(AppRoutes.otpScreen);
      },
    );
  }

  void onPinPutCompleted(BuildContext context, String code) async {
    try {
      if (_verificationId == null) return;

      await authRepo.checkCode(
        code: code,
        verificationId: _verificationId!,
      );

      // авторизован или нет
      authRepo.isNewUser
          ? Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.registrationInfo,
              (_) => false,
            )
          : Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.main,
              (_) => false,
            );
    } on FirebaseAuthException catch (e) {
      final localeMsg = FirebaseAuthExceptionHandler.generateMessage(e.message);
      if (localeMsg == null) return;
      emit(state.copyWith(errorMsg: localeMsg, status: BaseStatus.error));
    }
  }

  void onVkTapped(BuildContext context) {
    // Navigator.of(context).pushNamed(
    //   AppRoutes.searchGame,
    // );
  }
}
