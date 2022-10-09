import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/feachers/game/domain/entites/sport_.dart';
import 'package:teammate/feachers/game/presentation/create_game_screen/create_game_screen.dart';
import 'package:teammate/feachers/game/presentation/create_game_screen/cubit/create_game_cubit.dart';
import 'package:teammate/feachers/game/presentation/game_info_screen/cubit/game_info_screen_cubit.dart';
import 'package:teammate/feachers/main/presentation/main_screen/cubit/main_screen_cubit.dart';
import 'package:teammate/feachers/main/presentation/main_screen/main_screen.dart';
import 'package:teammate/feachers/search_game/presentation/search_game_screen/cubit/search_game_screen_cubit.dart';
import 'package:teammate/feachers/search_game/presentation/search_game_screen/search_game_screen.dart';
import 'package:teammate/feachers/settings/presentation/settings_screen/cubit/settings_screen_cubit.dart';
import 'package:teammate/feachers/settings/presentation/settings_screen/settings_screen.dart';

import '../../feachers/game/domain/entites/game.dart';
import '../../feachers/game/presentation/game_info_screen/game_info_screen.dart';
import '../injection_container.dart';

class AppRoutes {
  static const main = 'main';
  static const createGame = 'createGame';
  static const searchGame = 'searchGame';
  static const gameInfo = 'gameInfo';
  static const settings = 'settings';
}

class AppRouter {
  static const intialRoute = AppRoutes.main;

  Route onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // ГЛАВНЫЙ
      case AppRoutes.main:
        return _buildMainScreen();
      // СОЗДАТЬ ИГРУ
      case AppRoutes.createGame:
        return _buildCreateGameScreen(routeSettings);
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

  Route _buildMainScreen() {
    return MaterialPageRoute(
        builder: (context) => BlocProvider<MainScreenCubit>(
              lazy: false,
              create: (_) => MainScreenCubit(gamesRepo: sl())..load(),
              child: MainScreen(),
            ));
  }

  Route _buildCreateGameScreen(RouteSettings routeSettings) {
    final sport = routeSettings.arguments as Sport;
    return MaterialPageRoute(
        builder: (context) => BlocProvider(
              create: (_) => CreateGameCubit(
                gamesRepo: sl(),
                sport: sport,
              ),
              child: const CreateGameScreen(),
            ));
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
              create: (_) => SettingsScreenCubit(settingsRepo: sl()),
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
