import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:teammate/core/injection_container.dart' as di;
import 'package:teammate/core/session_data/session_data_service.dart';

import 'package:teammate/core/teammate_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SessionDataService.init();
  await Firebase.initializeApp();
  di.init();
  runApp(TeammateApp());
}
