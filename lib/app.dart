import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_it/pages/HomePage/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final List<AuthProvider<AuthListener, AuthCredential>> providers = [
    //   GoogleProvider(clientId: clientId)
    // ];

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          builder: EasyLoading.init(),
          initialRoute:
              FirebaseAuth.instance.currentUser == null ? '/sign-in' : '/home',
          title: 'Store It',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: const Color.fromARGB(255, 222, 224, 224),
            canvasColor: Colors.transparent,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.amber),
          ),
          routes: {
            '/sign-in': (context) {
              return SignInScreen(
                // providers: providers,
                actions: [
                  AuthStateChangeAction<SignedIn>(
                    (context, state) {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  ),
                ],
              );
            },
            '/home': (context) => const HomePage(),
          },
        );
      },
    );
  }
}
