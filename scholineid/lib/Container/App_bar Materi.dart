import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:scholineid/Container/list_detail_pelajaran.dart';
import 'package:scholineid/Container/list_quizz.dart';
import 'package:scholineid/Container/messages.dart';
import 'package:scholineid/Container/video.dart';
import 'package:scholineid/warna/constans.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class appBarMateri extends StatefulWidget {
  String email = "";
  String materi = "";
  String kelas = "";
  String semester = "";
  String guru = "";
  String uid ="";
  int like;
  appBarMateri({Key? key, required this.like, required this.email,required this.uid,required this.materi, required this.kelas, required this.semester, required this.guru })
      : super(key: key);

  @override
  State<appBarMateri> createState() => _appBarMateriState();
}

class _appBarMateriState extends State<appBarMateri> {
  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final TextEditingController message = new TextEditingController();
  Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection('Messages')
      .orderBy('time')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> _DetailStream = FirebaseFirestore.instance
        .collection('detail_materi')
        .where('mata_pelajaran', isEqualTo: widget.materi)
        .snapshots();
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Cblue,
            title: Text(
              "Detail Materi",textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
                Tab(
                  text: "Chapter",
                ),
                Tab(
                  text: "Discussion",
                ),
                Tab(
                  text: "Quiz",
                ),
                Tab(
                  text: "Modules",
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Detail_pelajaran(materi: widget.materi, semester: widget.semester ,kelas: widget.kelas,guru: widget.guru,uid: widget.uid, like: widget.like,),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                  child: ListView(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: messages(
                            mata_pelajaran: widget.materi,
                            email: widget.email,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: message,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 231, 231, 231),
                                  hintText: 'message',
                                  enabled: true,
                                ),
                                validator: (value) {},
                                onSaved: (value) {
                                  message.text = value!;
                                },
                              ),
                            ),
                            InkWell(
                              child: IconButton(
                                onPressed: () {
                                  if (message.text.isNotEmpty) {
                                    fs.collection('Messages').doc().set({
                                      'message': message.text.trim(),
                                      'time': DateTime.now(),
                                      'email': widget.email,
                                      'mata_pelajaran' : widget.materi
                                    });

                                    message.clear();
                                  }
                                },
                                icon: Icon(Icons.send_sharp),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
              Container(child: Quizz(materi: widget.materi)),
              Container(
                child: Text("Modules"),
              ),
            ],
          ),
        ));
  }
}
