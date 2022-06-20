import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scholineid/Container/Nama.dart';
import 'package:scholineid/Container/Search.dart';
import 'package:scholineid/Container/database_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scholineid/Container/all_guru.dart';
import 'package:scholineid/Container/all_material.dart';
import 'package:scholineid/Container/daftar_favorit.dart';
import 'package:scholineid/Container/dashboard_app_grid.dart';
import 'package:scholineid/Container/daftar_guru.dart';
import 'package:scholineid/Container/favorite.dart';
import 'package:scholineid/Container/login.dart';
import 'package:scholineid/models/data.dart';
import 'package:scholineid/warna/constans.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.32,
                decoration: BoxDecoration(
                  color: Color(0xFF5563EF),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
              ),
             
              Positioned(
                top: 80,
                left: 0,
                child: Image.asset('assets/images/orange.png')),
              // Positioned(
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 20, top: 80),
              //     child:
              //   ),
              // ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  "Welcome,",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      EvaIcons.bell,
                                      color: Colors.white.withOpacity(1),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: FutureBuilder(
                                          future: FireStoreDatabase().getData(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasError) {
                                              return const Text(
                                                  "Something wrong");
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                          NamaDiDashboard(
                            email: email,
                          ),
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Search(
                            email: email,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 45,
                      margin: EdgeInsets.only(left: 25, right: 25, top: 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                              left: 10,
                              top: 11,
                              child: Icon(
                                Icons.search,
                                color: Color.fromARGB(255, 73, 73, 73),
                              ),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  DataAppMenu(
                    email: email,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DaftarFavorit(email: email,),
                  SizedBox(
                    height: 20,
                  ),
                  DataAppGuru(),
                  SizedBox(
                    height: 120,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
