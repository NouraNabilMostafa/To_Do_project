// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
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
    apiKey: 'AIzaSyAk9bfFcWM15hnjPEQJv2MtZlEd0DNG_z4',
    appId: '1:490628792065:web:77e4ca3a566fc7f7faa500',
    messagingSenderId: '490628792065',
    projectId: 'iti-training-6229b',
    authDomain: 'iti-training-6229b.firebaseapp.com',
    storageBucket: 'iti-training-6229b.appspot.com',
    measurementId: 'G-7NHG6NP7GB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBT19ss4hyrMoNFj8N38XJ9M6V8usBzTVg',
    appId: '1:490628792065:android:5353f8a5ef740029faa500',
    messagingSenderId: '490628792065',
    projectId: 'iti-training-6229b',
    storageBucket: 'iti-training-6229b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAAObfqKKBUPfbN92b1izKzREFljMXuJQM',
    appId: '1:490628792065:ios:ae80b22029f7e180faa500',
    messagingSenderId: '490628792065',
    projectId: 'iti-training-6229b',
    storageBucket: 'iti-training-6229b.appspot.com',
    iosClientId: '490628792065-f56k1dv1ojfgpva3jpsm8arhhedfd4ph.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled1',
  );
}