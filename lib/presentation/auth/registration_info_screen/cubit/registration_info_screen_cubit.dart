import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/exception/custom_exception.dart';

import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/core/utils/base_status.dart';
import 'package:teammate/domain/entities/city.dart';
import 'package:teammate/domain/repos/registration_repo.dart';
import 'package:teammate/services/cities_repo.dart';

part 'registration_info_screen_state.dart';

class RegistrationInfoScreenCubit extends Cubit<RegistrationInfoScreenState> {
  RegistrationInfoScreenCubit({required this.registrationRepo})
      : super(RegistrationInfoScreenState.initial()) {
    _init();
  }

  final RegistrationRepo registrationRepo;

  Future<void> _init() async {
    final cities = await CitiesRepo.getCities();
    emit(
      state.copyWith(
        status: BaseStatus.loaded,
        cities: cities,
      ),
    );
  }

  void onNickChanged(String nick) {
    emit(state.copyWith(nick: nick));
  }

  void onCityChanged(City city) {
    emit(state.copyWith(city: city));
  }

  Future<void> onSaveTapped(BuildContext context) async {
    if (!isValid()) return;
    try {
      emit(state.copyWith(isRegistering: true));
      if (!await isNickAvalible()) return;
      await registrationRepo.register(
        nick: state.nick,
        city: state.city,
      );
      await navigatorKey.currentState?.pushReplacementNamed(AppRoutes.main);
    } on CustomException catch (e) {
      emit(
        state.copyWith(
          errorText: e.message,
          isRegistering: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorText: 'Что-то пошло не так. Попробуйте позже',
          isRegistering: false,
        ),
      );
    }
  }

  Future<bool> isNickAvalible() async {
    final isNickAvalible = await registrationRepo.isNickAvalible(state.nick);
    if (!isNickAvalible) {
      emit(
        state.copyWith(
          errorText: 'Данные никнейм пользователя уже занят',
          isRegistering: false,
        ),
      );
      return false;
    }
    return true;
  }

  bool isValid() {
    // поля заполнены
    if (state.nick.isEmpty || state.city.name.isEmpty) {
      emit(state.copyWith(errorText: 'Заполните все поля'));
      return false;
    }
    // город из списка
    if (!state.cities.contains(state.city)) {
      emit(state.copyWith(errorText: 'Выберите город из списка'));
      return false;
    }
    return true;
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
