import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scholineid/Container/login.dart';
import 'package:scholineid/Container/register_2.dart';
import 'package:scholineid/Container/reusable_widget/reusable_widget.dart';
import 'package:scholineid/warna/constans.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfPassword = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final fs = FirebaseFirestore.instance;
  var error = null;

  register(String email, String password) async {
    if (error == null) {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .whenComplete(() {
        fs.collection('user').doc().set({
          'email': controllerEmail.text.trim(),
          'time': DateTime.now(),
          'nama': controllerNama.text.trim(),
        });

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Register2()));
      });
    } else {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 30,
                    child: Image.asset("assets/images/lingkaran.png")),
                FlatButton(
                  padding: EdgeInsets.only(top: 50),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Positioned(
                    top: 45,
                    left: 40,
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xFF1F2050),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 45),
                          child: Text(
                            "Registration",
                            style: TextStyle(
                                color: Color(0xFF1F2050),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Center(
                        child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 100,
                                ),
                              ],
                            ),
                            child:
                                Image.asset('assets/images/Illustration.png')),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: reusableTextField("Full Name",
                          Icons.person_outline, false, controllerNama),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: reusableTextField("Email", Icons.person_outline,
                          false, controllerEmail),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: reusableTextField("Password", Icons.lock_outline,
                          true, controllerPassword),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: reusableTextField("Confirm Password",
                          Icons.lock_outline, true, controllerConfPassword),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: 400,
                      height: 55,
                      child: TextButton(
                          onPressed: () {
                            if (controllerEmail.text == "" &&
                                controllerNama.text == "" &&
                                controllerPassword.text == "" &&
                                controllerConfPassword.text == "") {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Ada Data Yang Kosong'),
                              ));
                            } else {
                              if (controllerPassword.text ==
                                  controllerConfPassword.text) {
                                register(controllerEmail.text,
                                    controllerPassword.text);
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text('Password Tidak Sama'),
                                ));
                              }
                            }
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Cblue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          child: Text(
                            "Next",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                    ),
                    SizedBox(height: 20),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
