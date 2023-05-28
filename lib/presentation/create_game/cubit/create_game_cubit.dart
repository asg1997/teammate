import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/core/session_data/session_data_service.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/domain/entities/city.dart';
import 'package:teammate/domain/entities/game_info/game_info.dart';
import 'package:teammate/domain/entities/sport.dart';
import 'package:teammate/domain/repos/game_repo.dart';

part 'create_game_state.dart';
part 'create_game_cubit.freezed.dart';

class CreateGameCubit extends Cubit<CreateGameState> {
  CreateGameCubit({
    required this.gameRepo,
    required this.sport,
  }) : super(CreateGameState.initial());
  final Sport sport;
  final GameRepo gameRepo;

  void onSaveGameTapped() => navigatorKey.currentState?.pop();

  void onNextStep() {
    if (state.currentStep == 0) {
      state.name.isEmpty
          ? emit(state.copyWith(error: 'Укажите название'))
          : emit(
              state.copyWith(
                currentStep: 1,
                error: '',
              ),
            );
    } else if (state.currentStep == 1) {
      state.dateTime.year == 0
          ? emit(state.copyWith(error: 'Выберите дату и время'))
          : emit(
              state.copyWith(
                currentStep: 2,
                error: '',
              ),
            );
    } else {
      if (state.locationName.isEmpty) {
        emit(state.copyWith(error: 'Укажите место'));
      } else {
        emit(state.copyWith(error: ''));
        _createGame();
      }
    }
  }

  void onPreviousStep() {
    if (state.currentStep != 0) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    } else {
      navigatorKey.currentState?.pop();
    }
  }

  void onNameChanged(String value) {
    emit(state.copyWith(name: value));
  }

  void onCityChanged(City value) {
    emit(state.copyWith(city: value));
  }

  void onPlaceChanged(String value) {
    emit(state.copyWith(locationName: value));
  }

  void onDateTimeChanged(DateTime value) {
    emit(state.copyWith(dateTime: value));
  }

  void onPriceChanged(String value) {
    emit(state.copyWith(price: value));
  }

  Future<void> _createGame() async {
    emit(state.copyWith(isCreatingGame: true));
    try {
      final city = SessionDataService.sessionData?.city;
      if (city == null) return;
      final gameInfo = GameInfo(
        city: city,
        sport: sport,
        name: state.name,
        location: state.locationName,
        dateTime: state.dateTime,
        price: state.price,
      );
      final game = await gameRepo.createGame(gameInfo);
      await navigatorKey.currentState?.popAndPushNamed(
        AppRoutes.gameInfo,
        arguments: game,
      );
    } catch (e) {
      emit(state.copyWith(isCreatingGame: false));
    }

    // Navigator.popUntil(context, (route) => route.isFirst);
    // await Navigator.pushNamed(context, AppRoutes.gameInfo, arguments: game);
  }

// TODO: Добавить поле город

  void onSportChanged(Sport sport) {
    emit(state.copyWith(sport: sport));
  }
}
