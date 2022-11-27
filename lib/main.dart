import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:store_it/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders(
    [
      GoogleProvider(
          clientId:
              "373229889017-ic65d0lh1mn8gta48e0hmga3aalp6pnm.apps.googleusercontent.com",
          redirectUri:
              'https://store-it-daed5.firebaseapp.com/__/auth/handler'),
    ],
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
