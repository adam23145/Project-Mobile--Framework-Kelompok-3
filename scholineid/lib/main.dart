import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scholineid/Container/profile_get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scholineid/Container/Change_pass.dart';
import 'package:scholineid/Container/Dashboard.dart';
import 'package:scholineid/Container/Profile.dart';
import 'package:scholineid/Container/Search.dart';
import 'package:scholineid/Container/all_guru.dart';
import 'package:scholineid/Container/all_material.dart';
import 'package:scholineid/Container/login.dart';
import 'package:scholineid/Container/main_home.dart';
import 'package:scholineid/Container/onboarding/OnboardingScreen.dart';
import 'package:scholineid/Container/profile_change_pass.dart';
import 'package:scholineid/Container/register.dart';
import 'package:scholineid/Container/register_2.dart';
import 'package:scholineid/Container/reusable_widget/reusable_widget.dart';
import 'package:scholineid/quizz/screens/home_screen.dart';
import './quizz/model/db_connect.dart';
import 'package:scholineid/warna/constans.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  await Firebase.initializeApp(
      //   options: FirebaseOptions(
      // apiKey: "AIzaSyAkMhQq2TU7Xfythz2q_B72ATbCp_Q4yfE",
      // appId: "1:405495547016:web:6e3d810f15d236e4c18b3d",
      // messagingSenderId: "405495547016",
      // projectId: "schoolineid-434e8",
      );
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Scholine.id",
      theme: ThemeData(primaryColor: Colors.blue),
      home: email == null ? SplashScreen() : mainHome()));
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
      home: MyHomePage(),
    );
  }
}
// class Firestorage extends ChangeNotifier {
//   Firestorage
// }

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = 1;
    return AnimatedSplashScreen(
      splash: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Image.asset('assets/images/logo.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: const Text(
                "ScholLine.id",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Color(0xFF5563EF),
      nextScreen: name == 2 ? OnboardingScreen() : OnboardingScreen(),
      splashIconSize: 800,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
    );
  }
}
