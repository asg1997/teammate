// ignore_for_file: use_build_context_synchronously
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:teammate/core/exception/custom_exception.dart';

import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/domain/repos/auth_repo.dart';

part 'auth_screen_state.dart';

class AuthScreenCubit extends Cubit<AuthScreenState> {
  AuthScreenCubit({required this.authRepo}) : super(AuthScreenState.initial());

  final AuthRepo authRepo;
  String? _verificationId;

  void onPhoneChanged(String phone) {
    emit(
      state.copyWith(
        phone: phone,
        loginErrorMsg: '',
      ),
    );
  }

  Future<void> onAuthorizeTapped(BuildContext context) async {
    if (state.phoneNoSymbols.length != 12) {
      emit(state.copyWith(loginErrorMsg: 'Неправильно введен номер'));
      return;
    }
    emit(state.copyWith(isRequestingCode: true));
    try {
      await authRepo.sendCode(
        onError: (error) => Fluttertoast.showToast(msg: error),
        onCompleted: () {
          emit(state.copyWith(isRequestingCode: false));
          // авторизован или нет
          authRepo.isNewUser
              ? navigatorKey.currentState?.pushNamed(
                  AppRoutes.registrationInfo,
                )
              : navigatorKey.currentState?.pushNamedAndRemoveUntil(
                  AppRoutes.main,
                  (_) => false,
                );
        },
        phone: state.phoneNoSymbols,
        codeSend: (String verificationId, int? forceResendingToken) {
          emit(state.copyWith(isRequestingCode: false));
          _verificationId = verificationId;
          navigatorKey.currentState?.pushNamed(AppRoutes.otpScreen);
        },
      );
      emit(state.copyWith(isRequestingCode: false));
    } on CustomException catch (e) {
      if (e.message != null) await Fluttertoast.showToast(msg: e.message!);
      emit(state.copyWith(isRequestingCode: false));
    }
  }

  Future<void> onPinPutCompleted(String code) async {
    try {
      if (_verificationId == null) return;
      emit(state.copyWith(isCheckingCode: true));
      await authRepo.checkCode(
        code: code,
        verificationId: _verificationId!,
      );

      authRepo.isNewUser
          ? await navigatorKey.currentState?.pushNamedAndRemoveUntil(
              AppRoutes.registrationInfo,
              (route) => false,
            )
          : await navigatorKey.currentState?.pushNamedAndRemoveUntil(
              AppRoutes.main,
              (route) => false,
            );
    } on CustomException catch (e) {
      emit(
        state.copyWith(
          otpErrorMsg: e.message,
          isCheckingCode: false,
        ),
      );
    }
  }

  void onVkTapped(BuildContext context) {
    // navigatorKey.currentState?.pushNamed(
    //   AppRoutes.searchGame,
    // );
  }
}
