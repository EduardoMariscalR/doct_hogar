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
    apiKey: 'AIzaSyC4Ck6ghhyyAH0DJuQ_a7uib-1c-FrkgSE',
    appId: '1:955233727354:web:6dc90cc8878ed141389cc3',
    messagingSenderId: '955233727354',
    projectId: 'docthogar-a0425',
    authDomain: 'docthogar-a0425.firebaseapp.com',
    storageBucket: 'docthogar-a0425.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_EaS_Bb3DcAkDgU917G5jT6ir0BxjlZ4',
    appId: '1:955233727354:android:6eacc4fd351ef559389cc3',
    messagingSenderId: '955233727354',
    projectId: 'docthogar-a0425',
    storageBucket: 'docthogar-a0425.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAg3SKTFkn-TAGE-zSYAVr1TMwL285s-k0',
    appId: '1:955233727354:ios:a5abb4d4e79aefd2389cc3',
    messagingSenderId: '955233727354',
    projectId: 'docthogar-a0425',
    storageBucket: 'docthogar-a0425.appspot.com',
    iosClientId: '955233727354-nt35qioc2rksipq8n75lb0phh4kah4i4.apps.googleusercontent.com',
    iosBundleId: 'com.example.doctHogar',
  );
}
