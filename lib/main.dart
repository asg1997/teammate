import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const TeammateApp());
}

class TeammateApp extends StatelessWidget {
  const TeammateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
