import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:teammate/core/injection_container.dart';
import 'package:teammate/domain/entities/game/game.dart';
import 'package:teammate/presentation/auth/auth_screen/auth_screen.dart';
import 'package:teammate/presentation/auth/otp_screen/otp_screen.dart';
import 'package:teammate/presentation/auth/registration_info_screen/cubit/registration_info_screen_cubit.dart';
import 'package:teammate/presentation/auth/registration_info_screen/registration_info.dart';
import 'package:teammate/presentation/create_game/create_game.dart';
import 'package:teammate/presentation/edit_game/edit_game_screen.dart';
import 'package:teammate/presentation/game_info_screen/game_info_screen.dart';
import 'package:teammate/presentation/game_info_screen/model.dart';
import 'package:teammate/presentation/main_screen/main_screen.dart';
import 'package:teammate/presentation/main_screen/model.dart';
import 'package:teammate/presentation/search_game/cubit/search_game_screen_cubit.dart';
import 'package:teammate/presentation/search_game/search_game_screen.dart';
import 'package:teammate/presentation/settings/cubit/settings_screen_cubit.dart';

import 'package:teammate/presentation/settings/settings_screen.dart';
import 'package:teammate/presentation/splash/splash_screen.dart';

class AppRoutes {
  static const auth = 'auth';
  static const otpScreen = 'otpScreen';
  static const recoveredPassword = 'recoveredPassword';

  static const registrationInfo = 'registrationInfo';
  static const vkAuth = 'vkAuth';
  static const main = 'main';
  static const searchGame = 'searchGame';
  static const gameInfo = 'gameInfo';
  static const settings = 'settings';
  static const createGame = 'createGame';
  static const editGame = 'editGame';
  static const splash = 'splash';
}

class AppRouter {
  String get initialRoute => AppRoutes.splash;

  Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // АВТОРИЗАЦИЯ
      case AppRoutes.auth:
        return _buildAuthScreen();

      // OTP
      case AppRoutes.otpScreen:
        return _buildOtpScreen();

      // ИНФОРМАЦИЯ О РЕГИСТРАЦИИ
      case AppRoutes.registrationInfo:
        return _buildRegistrationInfoScreen();

      // ГЛАВНЫЙ
      case AppRoutes.main:
        return _buildMainScreen();
      // ШАГ ОДИН
      case AppRoutes.createGame:
        return _buildCreateGame(routeSettings);

      // НАСТРОЙКИ
      // ИНФА ОБ ИГРЕ
      case AppRoutes.gameInfo:
        return _buildGameInfoScreen(routeSettings);
      // ПОИСК
      case AppRoutes.searchGame:
        return _buildSearchGameScreen();
      // Редактирование игры
      case AppRoutes.editGame:
        return _buildEditGameScreen();
      // splash
      case AppRoutes.splash:
        return _buildSplash();
      default:
        return _buildNavigationUnkwown();
    }
  }

  Route<dynamic> _buildAuthScreen() {
    return MaterialPageRoute(
      builder: (context) => const AuthScreen(),
    );
  }

  Route<dynamic> _buildOtpScreen() {
    return MaterialPageRoute(
      builder: (context) => const OtpScreen(),
    );
  }

  Route<dynamic> _buildRegistrationInfoScreen() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider<RegistrationInfoScreenCubit>(
        lazy: false,
        create: (_) => RegistrationInfoScreenCubit(registrationRepo: sl()),
        child: const RegistrationInfoScreen(),
      ),
    );
  }

  Route<dynamic> _buildMainScreen() {
    return MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider<MainScreenModel>(
        lazy: false,
        create: (_) => MainScreenModel(gamesRepo: sl()),
        child: MainScreen(),
      ),
    );
  }

  Route<dynamic> _buildCreateGame(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => const CreateGameScreen(),
    );
  }

  // Route<dynamic> _buildStepTwoScreen(RouteSettings routeSettings) {
  //   return MaterialPageRoute(
  //     builder: (context) => const StepTwoScreen(),
  //   );
  // }

  // Route<dynamic> _buildStepThreeScreen(RouteSettings routeSettings) {
  //   return MaterialPageRoute(
  //     builder: (context) => const StepThreeScreen(),
  //   );
  // }

  Route<dynamic> _buildGameInfoScreen(RouteSettings routeSettings) {
    final game = routeSettings.arguments as Game;
    return MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (_) => GameInfoScreenModel(
          game: game,
          gamesRepo: sl(),
        ),
        child: const GameInfoScreen(),
      ),
    );
  }

  Route<dynamic> _buildSearchGameScreen() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        lazy: false,
        create: (_) => SearchGameScreenCubit(
          searchRepo: sl(),
          profileRepo: sl(),
        )..load(),
        child: const SearchGameScreen(),
      ),
    );
  }

  Route<dynamic> _buildEditGameScreen() {
    return MaterialPageRoute(
      builder: (context) => const EditGameScreen(),
    );
  }

  Route<dynamic> _buildSettingsScreen() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (_) => SettingsScreenCubit(settingsRepo: sl())..load(),
        child: const SettingsScreen(),
      ),
    );
  }

  Route<dynamic> _buildNavigationUnkwown() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(child: Text('Ошибка навигации')),
      ),
    );
  }

  Route<dynamic> _buildSplash() {
    return MaterialPageRoute(
      builder: (context) => const SplashScreen(),
    );
  }
}
