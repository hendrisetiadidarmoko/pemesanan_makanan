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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyAXxHRer8gOxbTNAUafDCC2GmYOYWpMyIU',
    appId: '1:1084195177372:web:1bd1c44c22209ffb66fe59',
    messagingSenderId: '1084195177372',
    projectId: 'pemesananmakanan-715b2',
    authDomain: 'pemesananmakanan-715b2.firebaseapp.com',
    storageBucket: 'pemesananmakanan-715b2.appspot.com',
    measurementId: 'G-4023Y7XEGH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUjqPpa9WPUG7KFLyLZIofvZ_L9asuiW4',
    appId: '1:1084195177372:android:9f15a97c998c23f866fe59',
    messagingSenderId: '1084195177372',
    projectId: 'pemesananmakanan-715b2',
    storageBucket: 'pemesananmakanan-715b2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQpiaDbA4OiqMAa7Ar2lMwu13Lbj_T1WY',
    appId: '1:1084195177372:ios:b03cb6b8cd21bb5b66fe59',
    messagingSenderId: '1084195177372',
    projectId: 'pemesananmakanan-715b2',
    storageBucket: 'pemesananmakanan-715b2.appspot.com',
    iosBundleId: 'com.example.pemesananMakanan',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQpiaDbA4OiqMAa7Ar2lMwu13Lbj_T1WY',
    appId: '1:1084195177372:ios:b03cb6b8cd21bb5b66fe59',
    messagingSenderId: '1084195177372',
    projectId: 'pemesananmakanan-715b2',
    storageBucket: 'pemesananmakanan-715b2.appspot.com',
    iosBundleId: 'com.example.pemesananMakanan',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAXxHRer8gOxbTNAUafDCC2GmYOYWpMyIU',
    appId: '1:1084195177372:web:94c7a0b3b335fff466fe59',
    messagingSenderId: '1084195177372',
    projectId: 'pemesananmakanan-715b2',
    authDomain: 'pemesananmakanan-715b2.firebaseapp.com',
    storageBucket: 'pemesananmakanan-715b2.appspot.com',
    measurementId: 'G-5VY7DPCFCV',
  );

}