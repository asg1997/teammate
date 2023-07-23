import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teammate/data/session_data.dart';
import 'package:teammate/domain/repos/cities_storage.dart';
import 'package:teammate/firebase_options.dart';
import 'package:teammate/presentation/games/games_page.dart';
import 'package:teammate/service/notifications_service.dart';
import 'package:teammate/core/dependency_injection.dart' as di;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  di.init();

  await SessionData().init(di.sl());

  await CitiesStorage().init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await NotificationsService().init();

  runApp(const ProviderScope(child: TeammateApp()));
}

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
      home: const GamesPage(),
    );
  }
}
