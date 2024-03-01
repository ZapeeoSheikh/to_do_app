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
    apiKey: 'AIzaSyA1pS3FJJ_X4DjSrk4RAklYQNNuU6-ZMo8',
    appId: '1:233240694831:web:f3140f8af152828cc336da',
    messagingSenderId: '233240694831',
    projectId: 'todo-app-5b49e',
    authDomain: 'todo-app-5b49e.firebaseapp.com',
    storageBucket: 'todo-app-5b49e.appspot.com',
    measurementId: 'G-QJD04RYW6W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYuT70mplnbpn8vExRhB2j7GFJNd6T4kI',
    appId: '1:233240694831:android:9a62c0ecb9824680c336da',
    messagingSenderId: '233240694831',
    projectId: 'todo-app-5b49e',
    storageBucket: 'todo-app-5b49e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYqTxvQGC1oUffhmLRmEPSy3YeNvrutD0',
    appId: '1:233240694831:ios:45cb226cbee62062c336da',
    messagingSenderId: '233240694831',
    projectId: 'todo-app-5b49e',
    storageBucket: 'todo-app-5b49e.appspot.com',
    iosBundleId: 'com.mycompany.todoapp',
  );
}