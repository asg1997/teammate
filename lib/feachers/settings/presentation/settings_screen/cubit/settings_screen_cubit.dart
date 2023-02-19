import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/core/bloc_utils/base_status.dart';
import 'package:teammate/feachers/settings/domain/repos/settings_repo.dart';

part 'settings_screen_state.dart';

class SettingsScreenCubit extends Cubit<SettingsScreenState> {
  SettingsScreenCubit({required SettingsRepo settingsRepo})
      : _settingsRepo = settingsRepo,
        super(SettingsScreenState.initial());

  final SettingsRepo _settingsRepo;

  void load() async {
    emit(state.copyWith(status: BaseStatus.loading));
    final user = await _settingsRepo.getUser();
    emit(state.copyWith(
      status: BaseStatus.loaded,
      nickname: user.nickname,
      city: user.city,
    ));
  }

  void onNickChanged(String nickname) {
    emit(state.copyWith(nickname: nickname));
  }

  void onCityChanged(String city) {
    emit(state.copyWith(city: city));
  }

  void onSaveTapped(BuildContext context) {
    Navigator.pop(context);
  }
}
