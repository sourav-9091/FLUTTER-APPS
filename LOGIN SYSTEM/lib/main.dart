import 'package:flutter/material.dart';
import 'package:kiitpass/Pages/dashBoard.dart';
import 'package:kiitpass/Pages/loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kiitpass/Pages/navBar.dart';
import 'package:kiitpass/Pages/singUp.dart';
import 'package:kiitpass/Pages/splash.dart';
import 'package:kiitpass/Pages/textField.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'Pages/mysql.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    theme: ThemeData(primarySwatch: Colors.green),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Splash(),
      duration: 800,
      splashIconSize: 200,
      animationDuration: Duration(milliseconds: 500),
      backgroundColor: Colors.white,
      splashTransition: SplashTransition.fadeTransition,
      nextScreen: LoginPage(),
    );
  }
}
