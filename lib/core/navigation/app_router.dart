import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/feachers/game/domain/entites/sport_.dart';
import 'package:teammate/feachers/game/presentation/create_game_screen/create_game_screen.dart';
import 'package:teammate/feachers/game/presentation/create_game_screen/cubit/create_game_cubit.dart';
import 'package:teammate/feachers/main/presentation/main_screen/cubit/main_screen_cubit.dart';
import 'package:teammate/feachers/main/presentation/main_screen/main_screen.dart';
import 'package:teammate/feachers/search_game/presentation/search_game_screen/cubit/search_game_screen_cubit.dart';
import 'package:teammate/feachers/search_game/presentation/search_game_screen/search_game_screen.dart';

import '../injection_container.dart';

class AppRoutes {
  static const main = 'main';
  static const createGame = 'createGame';
  static const searchGameScreen = 'searchGameScreen';
}

class AppRouter {
  static const intialRoute = AppRoutes.main;

  Route onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.main:
        return _buildMainScreen();
      case AppRoutes.createGame:
        return _buildCreateGameScreen(routeSettings);
      case AppRoutes.searchGameScreen:
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

  Route _buildSearchGameScreen() {
    return MaterialPageRoute(
        builder: (context) => BlocProvider(
              create: (_) => SearchGameScreenCubit(searchRepo: sl()),
              child: const SearchGameScreen(),
            ));
  }

  Route _buildNavigationUnkwown() {
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Center(child: Text('Ошибка навигации')),
            ));
  }
}
