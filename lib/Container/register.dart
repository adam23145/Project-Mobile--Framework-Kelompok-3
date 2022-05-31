import 'package:flutter/material.dart';
import 'package:tugas_akhir/Container/reusable_widget/reusable_widget.dart';
import 'package:tugas_akhir/warna/constans.dart';


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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        title: Text("Registration" , style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
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
                    child: Image.asset('images/1.png')),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: reusableTextField(
                  "Full Name", Icons.person_outline, false, controllerNama),
            ),
            SizedBox(
              height: 20,
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
                  "Password", Icons.lock_outline, true, controllerEmail),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: reusableTextField(
                  "Confirm Password", Icons.lock_outline, false, controllerEmail),
            ),
            SizedBox(
              height: 80,
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
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ),
            ],
          ),
      ),
    );
  }
}