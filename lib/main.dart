import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/feachers/auth/data/local_storage.dart';
import 'package:teammate/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final shPrefs = await SharedPreferences.getInstance();

  final container = ProviderContainer(
    overrides: [
      localStorageProvider.overrideWithValue(LocalStorageImpl(shPrefs)),
    ],
  );

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const TeammateApp(),
    ),
  );
}
