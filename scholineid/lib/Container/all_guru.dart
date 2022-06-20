import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scholineid/Container/Dashboard.dart';
import 'package:scholineid/Container/messagesPrivate/message_private.dart';
import 'package:scholineid/warna/constans.dart';

import 'daftar_materi_grid.dart';

class guru extends StatefulWidget {
  String paket = "";
  guru({Key? key, required this.paket}) : super(key: key);

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
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                foregroundColor: Color.fromARGB(255, 16, 69, 112),
                title: Text(
                  "All Teacher",
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(children: [
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
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 10,
                                                                        left:
                                                                            20),
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
                                                                  child: Text(qs[
                                                                      'name']),
                                                                ),
                                                                Container(
                                                                  child: Text(qs[
                                                                      'tutor']),
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
                                                                        child: Text(
                                                                            qs['nip']),
                                                                      )
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          widget.paket ==
                                                                  "free plan"
                                                              ? ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                  content: Text(
                                                                      'Ayo Langganan'),
                                                                ))
                                                              : Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          messagePrivate(
                                                                            materi:
                                                                                qs['tutor'],
                                                                            namaGuru:
                                                                                qs['name'],
                                                                          )));
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 16),
                                                          child: Image.asset(
                                                              "assets/images/Chat.png"),
                                                        ),
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
                    )
                  ],
                ),
              ));
        });
  }
}
