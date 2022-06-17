import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scholineid/Container/Nama.dart';
import 'package:scholineid/Container/Paket.dart';
import 'package:scholineid/Container/database_manager.dart';
import 'package:scholineid/Container/profile_get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scholineid/Container/Dashboard.dart';
import 'package:scholineid/Container/all_material.dart';
import 'package:scholineid/Container/dashboard_app_grid.dart';
import 'package:scholineid/Container/daftar_guru.dart';
import 'package:scholineid/Container/favorite.dart';
import 'package:scholineid/Container/login.dart';
import 'package:scholineid/models/data.dart';
import 'package:scholineid/warna/constans.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String email = "";

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString('email')!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmail();
  }

  Future logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('email');
    Navigator.push(
        context, MaterialPageRoute(builder: (contex) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFF5563EF),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 45,
                        ),
                        child: Text(
                          "My Account",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 40, right: 40, top: 0),
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: FutureBuilder(
                                  future: FireStoreDatabase().getData(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return const Text("Something wrong");
                                    }
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            snapshot.data.toString()),
                                      );
                                    }
                                    return Text("");
                                  }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: NamaDiDashboard(
                                email: email,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: Image.asset("assets/images/kunci.png"),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.27,
                        child: paket(email: email)),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: 400,
                      height: 45,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 0.1,
                              blurRadius: 6,
                              offset:
                                  Offset(0, 4), // changes position of shadow
                            )
                          ],
                        ),
                        child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                backgroundColor: abuBiru,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: MaterialButton(
                        onPressed: () {},
                        child: Container(
                          height: 70,
                          width: 370,
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 0.1,
                                blurRadius: 6,
                                offset:
                                    Offset(0, 4), // changes position of shadow
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Icon(
                                      EvaIcons.bellOutline,
                                      color: Cblue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    child: Text("Notifications"),
                                  ),
                                ],
                              ),
                              Container(
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.3)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        showAlertDialog(BuildContext context) {
                          // set up the buttons
                          Widget cancelButton = TextButton(
                            child: Text("Cancel"),
                            onPressed: () {},
                          );
                          Widget continueButton = TextButton(
                            child: Text("Continue"),
                            onPressed: () {},
                          );

                          // set up the AlertDialog
                          AlertDialog alert = AlertDialog(
                            title: Text("AlertDialog"),
                            content: Text(
                                "Would you like to continue learning how to use Flutter alerts?"),
                            actions: [
                              cancelButton,
                              continueButton,
                            ],
                          );

                          // show the dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          height: 70,
                          width: 370,
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 0.1,
                                blurRadius: 6,
                                offset:
                                    Offset(0, 4), // changes position of shadow
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Icon(
                                      EvaIcons.logOut,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    child: Text(
                                      "Logout",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
