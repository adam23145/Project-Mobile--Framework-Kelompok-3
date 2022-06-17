import 'package:flutter/material.dart';
import 'package:scholineid/Container/reusable_widget/reusable_widget.dart';
import 'package:scholineid/warna/constans.dart';

class ProfileChange extends StatefulWidget {
  const ProfileChange({Key? key}) : super(key: key);

  @override
  State<ProfileChange> createState() => _ProfileChangeState();
}

class _ProfileChangeState extends State<ProfileChange> {
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  top: 45,
                  left: 40,
                  child: Icon(
                    Icons.arrow_back,
                    color: Color(0xFF1F2050),
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
                            "Settings",
                            style: TextStyle(
                                color: Color(0xFF1F2050),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 40),
                          child: Text("Account"),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 70,
                        width: 370,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Icon(Icons.document_scanner_rounded),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          "Change Password",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "Change your current password",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              child: Icon(Icons.arrow_forward_sharp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 40),
                          child: Text("Preferences"),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 70,
                        width: 370,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Icon(Icons.directions_ferry_rounded),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          "Help & Support",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "Report some issues !",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              child: Icon(Icons.arrow_forward_sharp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 70,
                        width: 370,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Icon(Icons.logout_sharp ,color: Colors.red,),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          "Log out",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400, color: Colors.red),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "Log out of your current account",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
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
