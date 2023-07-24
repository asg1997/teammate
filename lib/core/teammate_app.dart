import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:teammate/data/session_data.dart';
import 'package:teammate/presentation/games/games_page.dart';
import 'package:teammate/presentation/nickname/nickname_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class TeammateApp extends StatelessWidget {
  const TeammateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru'),
      ],
      navigatorKey: navigatorKey,
      home: SessionData().currentUser.nickname.isEmpty
          ? const NicknamePage()
          : const GamesPage(),
    );
  }
}
