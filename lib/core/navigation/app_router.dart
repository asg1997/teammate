import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/feachers/auth/presentation/auth_screen/presentation/auth_screen.dart';
import 'package:teammate/feachers/auth/presentation/registration_info_screen/presentation/cubit/registration_info_screen_cubit.dart';
import 'package:teammate/feachers/auth/presentation/registration_info_screen/presentation/registration_info.dart';
import 'package:teammate/feachers/auth/presentation/registration_screen/presentation/cubit/registration_screen_cubit.dart';
import 'package:teammate/feachers/auth/presentation/registration_screen/presentation/registration_screen.dart';
import 'package:teammate/feachers/game/presentation/create_game_screen/step_one_screen.dart';
import 'package:teammate/feachers/game/presentation/create_game_screen/step_three_screen.dart';
import 'package:teammate/feachers/game/presentation/create_game_screen/step_two_screen.dart';
import 'package:teammate/feachers/game/presentation/game_info_screen/cubit/game_info_screen_cubit.dart';
import 'package:teammate/feachers/main/presentation/main_screen/cubit/main_screen_cubit.dart';
import 'package:teammate/feachers/main/presentation/main_screen/main_screen.dart';
import 'package:teammate/feachers/auth/presentation/recovered_password/presentation/recovered_password.dart';
import 'package:teammate/feachers/search_game/presentation/search_game_screen/cubit/search_game_screen_cubit.dart';
import 'package:teammate/feachers/search_game/presentation/search_game_screen/search_game_screen.dart';
import 'package:teammate/feachers/settings/presentation/settings_screen/cubit/settings_screen_cubit.dart';
import 'package:teammate/feachers/settings/presentation/settings_screen/settings_screen.dart';
import '../../feachers/auth/presentation/auth_screen/presentation/cubit/auth_screen_cubit.dart';
import '../../feachers/game/domain/entites/game.dart';
import '../../feachers/game/presentation/game_info_screen/game_info_screen.dart';
import '../injection_container.dart';

class AppRoutes {
  static const auth = 'auth';
  static const recoveredPassword = 'recoveredPassword';
  static const registration = 'registration';
  static const registrationInfo = 'registrationInfo';
  static const vkAuth = 'vkAuth';
  static const main = 'main';
  static const stepOne = 'stepOne';
  static const stepTwo = 'stepTwo';
  static const stepThree = 'stepThree';
  static const searchGame = 'searchGame';
  static const gameInfo = 'gameInfo';
  static const settings = 'settings';
}

class AppRouter {
  static const intialRoute = AppRoutes.auth;

  Route onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // АВТОРИЗАЦИЯ
      case AppRoutes.auth:
        return _buildAuthScreen();

      // РЕГИСТРАЦИЯ
      case AppRoutes.registration:
        return _buildRegistrationScreen();

      // ИНФОРМАЦИЯ О РЕГИСТРАЦИИ
      case AppRoutes.registrationInfo:
        return _buildRegistrationInfoScreen();

      // ЗАБЫЛИ ПАРОЛЬ
      case AppRoutes.recoveredPassword:
        return _buildRecoveredPassword();

      // ГЛАВНЫЙ
      case AppRoutes.main:
        return _buildMainScreen();
      // ШАГ ОДИН
      case AppRoutes.stepOne:
        return _buildStepOneScreen(routeSettings);
      // ШАГ ДВА
      case AppRoutes.stepTwo:
        return _buildStepTwoScreen(routeSettings);
      // ШАГ ТРИ
      case AppRoutes.stepThree:
        return _buildStepThreeScreen(routeSettings);
      // НАСТРОЙКИ
      case AppRoutes.settings:
        return _buildSettingsScreen();
      // ИНФА ОБ ИГРЕ
      case AppRoutes.gameInfo:
        return _buildGameInfoScreen(routeSettings);
      // ПОИСК
      case AppRoutes.searchGame:
        return _buildSearchGameScreen();
      default:
        return _buildNavigationUnkwown();
    }
  }

  Route _buildAuthScreen() {
    return MaterialPageRoute(
        builder: (context) => BlocProvider<AuthScreenCubit>(
              lazy: false,
              create: (_) => AuthScreenCubit(authRepo: sl()),
              child: const AuthScreen(),
            ));
  }

  Route _buildRegistrationScreen() {
    return MaterialPageRoute(
        builder: (context) => BlocProvider<RegistrationScreenCubit>(
              lazy: false,
              create: (_) => RegistrationScreenCubit(registrationRepo: sl()),
              child: const RegistrationScreen(),
            ));
  }

  Route _buildRegistrationInfoScreen() {
    return MaterialPageRoute(
        builder: (context) => BlocProvider<RegistrationInfoScreenCubit>(
              lazy: false,
              create: (_) =>
                  RegistrationInfoScreenCubit(registrationInfoRepo: sl()),
              child: const RegistrationInfoScreen(),
            ));
  }

  Route _buildRecoveredPassword() {
    return MaterialPageRoute(
        builder: (context) => const RecoveredPasswordScreen());
  }

  Route _buildMainScreen() {
    return MaterialPageRoute(
        builder: (context) => BlocProvider<MainScreenCubit>(
              lazy: false,
              create: (_) => MainScreenCubit(gamesRepo: sl())..load(),
              child: MainScreen(),
            ));
  }

  Route _buildStepOneScreen(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => const StepOneScreen(),
    );
  }

  Route _buildStepTwoScreen(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => const StepTwoScreen(),
    );
  }

  Route _buildStepThreeScreen(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => const StepThreeScreen(),
    );
  }

  Route _buildGameInfoScreen(RouteSettings routeSettings) {
    final game = routeSettings.arguments as Game;
    return MaterialPageRoute(
        builder: (context) => BlocProvider(
              create: (_) => GameInfoScreenCubit(
                game: game,
                gamesRepo: sl(),
              )..load(),
              child: const GameInfoScreen(),
            ));
  }

  Route _buildSearchGameScreen() {
    return MaterialPageRoute(
        builder: (context) => BlocProvider(
              lazy: false,
              create: (_) => SearchGameScreenCubit(
                searchRepo: sl(),
                profileRepo: sl(),
              )..load(),
              child: const SearchGameScreen(),
            ));
  }

  Route _buildSettingsScreen() {
    return MaterialPageRoute(
        builder: (context) => BlocProvider(
              create: (_) => SettingsScreenCubit(settingsRepo: sl())..load(),
              child: const SettingsScreen(),
            ));
  }

  Route _buildNavigationUnkwown() {
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Center(child: Text('Ошибка навигации')),
            ));
  }
}
