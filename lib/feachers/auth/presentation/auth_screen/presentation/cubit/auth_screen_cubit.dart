import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/bloc_utils/base_status.dart';
import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/feachers/auth/presentation/auth_screen/domain/repo/auth_repo.dart';

part 'auth_screen_state.dart';

class AuthScreenCubit extends Cubit<AuthScreenState> {
  AuthScreenCubit({required this.authRepo}) : super(AuthScreenState.initial());

  final AuthRepo authRepo;

  void onPhoneChanged(String phone) {
    emit(state.copyWith(phone: phone));
  }

  void onOtpScreen(BuildContext context) {
    if (state.phone.length != 10) {
      emit(state.copyWith(status: BaseStatus.error));
      return;
    }

    Navigator.of(context).pushNamed(AppRoutes.otpScreen);
  }

  void onRegistrationTapped(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.registration,
    );
  }

  void onVkTapped(BuildContext context) {
    // Navigator.of(context).pushNamed(
    //   AppRoutes.searchGame,
    // );
  }
}
