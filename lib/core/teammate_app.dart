import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teammate/core/consts/app_colors.dart';
import 'package:teammate/core/injection_container.dart';
import 'package:teammate/core/navigation/app_router.dart';
import 'package:teammate/presentation/auth/auth_provider.dart';
import 'package:teammate/presentation/auth/auth_screen/cubit/auth_screen_cubit.dart';
import 'package:teammate/presentation/create_game_screen/cubit/create_game_cubit.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class TeammateApp extends StatelessWidget {
  TeammateApp({super.key});
  final router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateGameCubit(
            gamesRepo: sl(),
          ),
        ),
        BlocProvider(
          create: (context) => AuthScreenCubit(authRepo: sl()),
        ),
        BlocProvider(create: (_) => sl<AuthProviderCubit>()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.secondaryBg,
          colorScheme: const ColorScheme.dark(),
          textTheme: GoogleFonts.openSansTextTheme(
            const TextTheme(
              titleMedium: TextStyle(color: Colors.black),
            ),
          ),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ru', 'RU'),
        ],
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: router.initialRoute,
        onGenerateRoute: router.onGenerateRoutes,
      ),
    );
  }
}
