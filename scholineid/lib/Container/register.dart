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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Registrasi Berhasil'),
        ));
        fs.collection('user').doc().set({
          'email': controllerEmail.text.trim(),
          'time': DateTime.now(),
          'nama': controllerNama.text.trim(),
          'paket': 'free plan'
        });

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Register2(
                      email: controllerEmail.text.trim(),
                    )));
      });
    } else {
      print(error);
    }
  }

  bool _isObscure3 = true;
  bool _isObscure2 = true;
  late String paket;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Color.fromARGB(255, 16, 69, 112),
        title: Text("Registration"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    child: Image.asset('assets/images/Illustration.png')),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: controllerNama,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Nama',
                        enabled: true,
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(color: Cblue),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(color: Cblue),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                      ),
                      onSaved: (value) {
                        controllerEmail.text = value!;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: controllerEmail,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email',
                        enabled: true,
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(color: Cblue),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(color: Cblue),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.length == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Email cannot be empty'),
                          ));
                          return "Email cannot be empty";
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Please enter a valid email'),
                          ));
                          return ("Please enter a valid email");
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        controllerEmail.text = value!;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: controllerPassword,
                      obscureText: _isObscure2,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure2
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure2 = !_isObscure2;
                              });
                            }),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        enabled: true,
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 15.0),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(color: Cblue),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(color: Cblue),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        RegExp regex = new RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Password cannot be empty'),
                          ));
                        }
                        if (!regex.hasMatch(value)) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'please enter valid password min. 6 character'),
                          ));
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        controllerPassword.text = value!;
                      },
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: controllerConfPassword,
                      obscureText: _isObscure3,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure3
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure3 = !_isObscure3;
                              });
                            }),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Konfirmasi Password',
                        enabled: true,
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 15.0),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(color: Cblue),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(color: Cblue),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        RegExp regex = new RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('Konfirmasi Password cannot be empty'),
                          ));
                        }
                        if (!regex.hasMatch(value)) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'please enter valid password min. 6 character'),
                          ));
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        controllerConfPassword.text = value!;
                      },
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
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
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Ada Data Yang Kosong'),
                      ));
                    } else {
                      if (controllerPassword.text ==
                          controllerConfPassword.text) {
                        register(controllerEmail.text, controllerPassword.text);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
        ),
      ),
    );
  }
}
