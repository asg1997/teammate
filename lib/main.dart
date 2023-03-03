import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:teammate/core/injection_container.dart' as di;

import 'core/teammate_app/teammate_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  di.init();
  runApp(TeammateApp());
}
