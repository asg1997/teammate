import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:teammate/core/dependency_injection.dart' as di;
import 'package:teammate/core/teammate_app.dart';
import 'package:teammate/data/session_data.dart';
import 'package:teammate/domain/repos/cities_storage.dart';
import 'package:teammate/firebase_options.dart';
import 'package:teammate/service/notifications_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();

  await GetIt.instance.allReady();

  await CitiesStorage().init();
  await NotificationsService().init();
  await SessionData().init(di.sl(), di.sl());
  runApp(const ProviderScope(child: TeammateApp()));
}
