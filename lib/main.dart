import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:teammate/core/teammate_app.dart';

import 'package:teammate/firebase_options.dart';
import 'package:teammate/service/notifications_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await NotificationsService().init();

  runApp(
    const ProviderScope(
      child: TeammateApp(),
    ),
  );
}
