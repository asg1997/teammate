import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/bloc_utils/base_status.dart';
import 'package:teammate/core/navigation/app_router.dart';
part 'otp_screen_state.dart';

class OtpScreenCubit extends Cubit<OtpScreenState> {
  OtpScreenCubit() : super(OtpScreenState.initial());

  void onLogInTapped(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.main,
      (_) => false,
    );
  }
}
