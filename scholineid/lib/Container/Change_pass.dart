import 'package:flutter/material.dart';
import 'package:scholineid/Container/reusable_widget/reusable_widget.dart';
import 'package:scholineid/warna/constans.dart';

class Change_pass extends StatefulWidget {
  const Change_pass({Key? key}) : super(key: key);

  @override
  State<Change_pass> createState() => _Change_passState();
}

class _Change_passState extends State<Change_pass> {
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfPassword = TextEditingController();
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
                  top: 45,
                  left: 40,
                      child: Icon(Icons.arrow_back, color: Color(0xFF1F2050),),
                    ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top:45),
                          child: Text(
                            "Settings",
                            style: TextStyle(
                                color: Color(0xFF1F2050), fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                        ),

                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Change Password" , style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: reusableTextField("Current password", Icons.person_outline,
                          true, controllerEmail),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: reusableTextField("New password", Icons.lock_outline,
                          true, controllerEmail),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: reusableTextField("Confirm Password",
                          Icons.lock_outline, true, controllerEmail),
                    ),
                    SizedBox(
                      height: 450,
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
                            "Change Password",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                    ),
                    SizedBox(height: 50,)
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
