import 'package:flutter/material.dart';
import 'package:tugas_akhir/Container/Dashboard.dart';
import 'package:tugas_akhir/Container/register.dart';
import 'package:tugas_akhir/Container/reusable_widget/reusable_widget.dart';
import 'package:tugas_akhir/warna/constans.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Image.asset('assets/images/logo.png')),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Welcome to ScolLine.id",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Stay signed in with your account to started study",
                  style: TextStyle(color: Color(0xFF828282)),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: reusableTextField(
                  "Email", Icons.person_outline, false, controllerEmail),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: reusableTextField(
                  "Password", Icons.lock_outline, true, controllerPassword),
            ),
            // Padding(
            //   //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            //   padding: const EdgeInsets.only(
            //       left: 30.0, right: 30.0, top: 15, bottom: 0),
            //   child: TextField(
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(
            //           borderSide: const BorderSide(width: 3, color: Cblue),
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         fillColor: Cblue,
            //         labelText: 'Email',
            //         hintText: 'Enter valid email id as abc@gmail.com'),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //       left: 30.0, right: 30.0, top: 15, bottom: 0),
            //   //padding: EdgeInsets.symmetric(horizontal: 15),
            //   child: TextField(
            //     obscureText: true,
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(
            //           borderSide: const BorderSide(width: 3, color: Cblue),
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         labelText: 'Password',
            //         hintText: 'Enter secure password'),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 33, right: 33),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Keep me signed in"),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: 400,
              height: 55,
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Cblue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: 400,
              height: 45,
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: abuBiru,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: Text(
                    "Login with Google",
                    style: TextStyle(color: Colors.black),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            new GestureDetector(
              onTap: () {
                Route route = MaterialPageRoute(builder: (context) => Register());
                Navigator.push(context, route);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t Have an Account?'),
                  Text(
                    ' Sign Up',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
