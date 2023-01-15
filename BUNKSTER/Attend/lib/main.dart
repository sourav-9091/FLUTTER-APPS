import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:attend/Pages/newPage.dart';
import 'package:attend/Pages/newPageDark.dart';
import 'package:attend/Pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Splash(),
      duration: 800,
      splashIconSize: 200,
      animationDuration: Duration(milliseconds: 500),
      backgroundColor: Colors.black,
      splashTransition: SplashTransition.fadeTransition,
      nextScreen: NewPageDark(),
    );
  }
}
