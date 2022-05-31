import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tugas_akhir/Container/Dashboard.dart';
import 'package:tugas_akhir/Container/login.dart';
import 'package:tugas_akhir/Container/onboarding/OnboardingScreen.dart';
import 'package:tugas_akhir/Container/register.dart';
import 'package:tugas_akhir/warna/constans.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = 1;
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Image.asset('assets/images/logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 280),
            child: const Text(
              "ScholLine.id",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )
        ],
      ),
      backgroundColor: Color(0xFF5563EF),
      nextScreen: name == 2
      ? MyHomePage()
      : OnboardingScreen(),
      splashIconSize: 800,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
    );
  }
}

