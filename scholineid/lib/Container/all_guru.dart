import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scholineid/Container/Dashboard.dart';
import 'package:scholineid/warna/constans.dart';

import 'daftar_materi_grid.dart';

class guru extends StatefulWidget {
  const guru({Key? key}) : super(key: key);

  @override
  State<guru> createState() => _guruState();
}

class _guruState extends State<guru> {
  Stream<QuerySnapshot> _messageStream =
      FirebaseFirestore.instance.collection('teacher').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _messageStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
              body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Positioned(
                        top: 40,
                        left: 10,
                        child: new FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xFF1F2050),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 45),
                            child: Text(
                              "All Teachers",
                              style: TextStyle(
                                  color: Color(0xFF1F2050),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    child: ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          QueryDocumentSnapshot qs =
                                              snapshot.data!.docs[index];
                                          return Container(
                                            height: 80,
                                            width: 270,
                                            child: Card(
                                              clipBehavior: Clip.antiAlias,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 10,
                                                                      left: 20),
                                                                  child:
                                                                      CircleAvatar(
                                                                          radius:
                                                                              25,
                                                                          backgroundImage:
                                                                              AssetImage(
                                                                            'assets/images/${qs['gambar']}',
                                                                          )),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 15,
                                                                      top: 10),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    child: Text(
                                                                        qs['name']),
                                                                  ),
                                                                  Container(
                                                                    child: Text(
                                                                        qs['tutor']),
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .star_rate_sharp,
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              190,
                                                                              158,
                                                                              53),
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(top: 4),
                                                                          child:
                                                                              Text(qs['nip']),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 16),
                                                          child: Image.asset(
                                                              "assets/images/Chat.png"),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    )
                  ],
                )
              ],
            ),
          ));
        });
  }
}
