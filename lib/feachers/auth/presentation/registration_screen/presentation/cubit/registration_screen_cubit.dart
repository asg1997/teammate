import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/bloc_utils/base_status.dart';
import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/feachers/auth/presentation/registration_screen/domain/repo/registration_repo.dart';
part 'registration_screen_state.dart';

class RegistrationScreenCubit extends Cubit<RegistrationScreenState> {
  RegistrationScreenCubit({
    required this.registrationRepo,
  }) : super(RegistrationScreenState.initial());

  final RegistrationRepo registrationRepo;

  void onNextTapped(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.registrationInfo,
    );
  }

  void onEmailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: password));
  }
}
