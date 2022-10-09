import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teammate/feachers/settings/domain/repos/settings_repo.dart';

part 'settings_screen_state.dart';

class SettingsScreenCubit extends Cubit<SettingsScreenState> {
  SettingsScreenCubit({required SettingsRepo settingsRepo})
      : _settingsRepo = settingsRepo,
        super(SettingsScreenInitial());
  final SettingsRepo _settingsRepo;
}
