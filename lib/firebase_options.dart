// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      return web;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAFlu9UyvIiCf0yXUWETK-nwcpfqgUmjp0',
    appId: '1:1026609213595:web:c2d0d39dfd8930d097563e',
    messagingSenderId: '1026609213595',
    projectId: 'notification-example-e4a4c',
    authDomain: 'notification-example-e4a4c.firebaseapp.com',
    storageBucket: 'notification-example-e4a4c.firebasestorage.app',
    measurementId: 'G-F8TMKE8E3H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC8I3jD3Sb2jKOSOSH8MbMhLQD4oSeKW4I',
    appId: '1:1026609213595:android:07f7ee71382f053697563e',
    messagingSenderId: '1026609213595',
    projectId: 'notification-example-e4a4c',
    storageBucket: 'notification-example-e4a4c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDgqOqdIdswLn0wYmInIj7faLSqRQJPAYY',
    appId: '1:1026609213595:ios:ed4957d3a50026a397563e',
    messagingSenderId: '1026609213595',
    projectId: 'notification-example-e4a4c',
    storageBucket: 'notification-example-e4a4c.firebasestorage.app',
    iosBundleId: 'com.example.notificationExample',
  );
}
