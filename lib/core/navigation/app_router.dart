import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teammate/feachers/main/presentation/main_screen/cubit/main_screen_cubit.dart';
import 'package:teammate/feachers/main/presentation/main_screen/main_screen.dart';

import '../injection_container.dart';

class AppRoutes {
  static const main = 'main';
}

class AppRouter {
  static const intialRoute = AppRoutes.main;

  Route onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.main:
        return _buildMainScreen();

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

  Route _buildNavigationUnkwown() {
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Center(child: Text('Ошибка навигации')),
            ));
  }

  // static GoRouter get router => _router;
  // static final _router = GoRouter(routes: [
  //   _main(),
  // ]);

  // static GoRoute _main() {
  //   return GoRoute(
  //     path: AppRoutes.main,
  //     builder: (context, state) => BlocProvider<MainScreenCubit>(
  //       create: (context) => MainScreenCubit(gamesRepo: sl())..load(),
  //       child: const MainScreen(),
  //     ),
  //   );
  // }
}
