import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/core/utils/base_status.dart';
import 'package:teammate/domain/repos/registration_info_repo.dart';

part 'registration_info_screen_state.dart';

class RegistrationInfoScreenCubit extends Cubit<RegistrationInfoScreenState> {
  RegistrationInfoScreenCubit({required this.registrationInfoRepo})
      : super(RegistrationInfoScreenState.initial());

  final RegistrationInfoRepo registrationInfoRepo;

  void onNickChanged(String nick) {
    emit(state.copyWith(nick: nick));
  }

  void onCityChanged(String city) {
    emit(state.copyWith(city: city));
  }

  void onSaveTapped(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.main,
      (_) => false,
    );
  }

  // void onNameChanged(String name) {
  //   emit(state.copyWith(name: name));
  // }

  // void onDateChanged(DateTime dateTime) {
  //   emit(state.copyWith(dateTime: dateTime));
  // }

  // void onGenderChanged(String gender) {
  //   emit(state.copyWith(gender: gender));
  // }
}
