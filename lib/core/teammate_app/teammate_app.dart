import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:teammate/core/consts/app_colors.dart';
import 'package:teammate/core/injection_container.dart';
import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/feachers/game/presentation/create_game_screen/cubit/create_game_cubit.dart';

class TeammateApp extends StatelessWidget {
  TeammateApp({Key? key}) : super(key: key);
  final router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateGameCubit(
        gamesRepo: sl(),
      ),
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: AppColors.secondaryBg),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ru', 'RU'),
        ],
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.intialRoute,
        onGenerateRoute: router.onGenerateRoutes,
      ),
    );
  }
}

// final _router = GoRouter(routes: [
//   GoRoute(
//     routes: const [],
//     path: '/',
//     builder: (context, state) => const MainScreen(),
//   ),
// ]);
