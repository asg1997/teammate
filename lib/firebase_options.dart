// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAULc0il-9nATuhpSGKzZ7KwJsYmAGwooc',
    appId: '1:241663777855:android:d6f7478cc32ba7a5dcec8a',
    messagingSenderId: '241663777855',
    projectId: 'teammateapp-44b53',
    storageBucket: 'teammateapp-44b53.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_smWO_5FMo89Wko_AsBvFG4zlchvYQjM',
    appId: '1:241663777855:ios:103d388cb9f1233adcec8a',
    messagingSenderId: '241663777855',
    projectId: 'teammateapp-44b53',
    storageBucket: 'teammateapp-44b53.appspot.com',
    androidClientId: '241663777855-1j03bvvvmd7ne51mqot4a38aibefcqnf.apps.googleusercontent.com',
    iosClientId: '241663777855-sa72dsr8lirkcmhfj7hluunjl3h8ihtn.apps.googleusercontent.com',
    iosBundleId: 'com.angelinagromova.Teammate',
  );
}
