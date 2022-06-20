import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:scholineid/Container/App_bar%20Materi.dart';
import 'package:scholineid/Container/Dashboard.dart';
import 'package:scholineid/Container/like_widget.dart';
import 'package:scholineid/warna/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'daftar_materi_grid.dart';

class favorite extends StatefulWidget {
  String materi = "";
  String email = "";
  String paket2 ="";
  favorite({Key? key, required this.materi, required this.email, required this.paket2})
      : super(key: key);

  @override
  State<favorite> createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
        .collection('daftar_favorit')
        .where('title', isEqualTo: widget.materi)
        .snapshots();
    return StreamBuilder(
        stream: _messageStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                foregroundColor: Color.fromARGB(255, 16, 69, 112),
                title: Text(
                  "Daftar Materi",
                  textAlign: TextAlign.center,
                ),
              ),
            ));
          }
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                foregroundColor: Color.fromARGB(255, 16, 69, 112),
                centerTitle: true,
                title: Text(
                  "Daftar Materi",
                  textAlign: TextAlign.center,
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
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
                                        itemCount: widget.paket2 == "free plan"
                                        ? snapshot.data!.docs.length == 0
                                          ? 0 
                                          : 1
                                        : snapshot.data!.docs.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          QueryDocumentSnapshot qs =
                                              snapshot.data!.docs[index];

                                          return MaterialButton(
                                            onPressed: () {
                                              print(qs['kelas']);
                                              print(qs['sem']);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          appBarMateri(
                                                            paket2: widget.paket2,
                                                            like: qs['total_like'],
                                                            uid: qs['Uid'],
                                                            guru: qs['nama_pengajar'],
                                                              email:
                                                                  widget.email,
                                                              kelas:
                                                                  qs['kelas'],
                                                              semester:
                                                                  qs['sem'],
                                                              materi: qs[
                                                                  'title'])));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.1),
                                                    spreadRadius: 0.1,
                                                    blurRadius: 6,
                                                    offset: Offset(0,
                                                        4), // changes position of shadow
                                                  )
                                                ],
                                              ),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Card(
                                                clipBehavior: Clip.antiAlias,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Ink.image(
                                                          image: NetworkImage(
                                                              qs['image']),
                                                          height: 150,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 20,
                                                          top: 10,
                                                          right: 20),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                qs['title'],
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                              Text(qs[
                                                                  'nama_pengajar'])
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                EvaIcons.heart,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                              Container(
                                                                  child:
                                                                      like_widget(
                                                                like: qs['total_like'],
                                                              ))
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20,
                                                              right: 20,
                                                              bottom: 20),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                  Icons.people),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(qs[
                                                                  'student']),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child: Row(
                                                              children: [
                                                                Icon(Icons
                                                                    .book_rounded),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                    '${qs['modul']} modules'),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
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
                ),
              ));
        });
  }
}
