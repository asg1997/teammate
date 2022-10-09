import 'package:flutter/material.dart';
import 'package:teammate/core/injection_container.dart' as di;

import 'core/teammate_app/teammate_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(TeammateApp());
}
