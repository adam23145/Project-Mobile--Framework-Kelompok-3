
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:scholineid/Container/list_detail_pelajaran.dart';
import 'package:scholineid/Container/list_modul.dart';
import 'package:scholineid/Container/list_quizz.dart';
import 'package:scholineid/Container/messages.dart';
import 'package:scholineid/Container/video.dart';
import 'package:scholineid/warna/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class appBarMateri extends StatefulWidget {
  String email = "";
  String materi = "";
  String kelas = "";
  String semester = "";
  String guru = "";
  String uid = "";
  int like;
  String paket2 = "";
  appBarMateri(
      {Key? key,
      required this.like,
      required this.email,
      required this.uid,
      required this.materi,
      required this.kelas,
      required this.semester,
      required this.guru,
      required this.paket2})
      : super(key: key);

  @override
  State<appBarMateri> createState() => _appBarMateriState();
}

class _appBarMateriState extends State<appBarMateri> {
  late int dc;
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
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            foregroundColor: Color.fromARGB(255, 16, 69, 112),
            title: Text(
              "Detail Materi",
              textAlign: TextAlign.center,
            ),
            bottom: TabBar(
              indicatorColor: Color.fromARGB(255, 16, 69, 112),
              indicatorWeight: 5,
              labelColor: Color.fromARGB(255, 16, 69, 112),
              tabs: [
                Tab(
                  text: "Chapter" ,
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
              Detail_pelajaran(
                paket: widget.paket2,
                materi: widget.materi,
                semester: widget.semester,
                kelas: widget.kelas,
                guru: widget.guru,
                uid: widget.uid,
                like: widget.like,
              ),
              Container(
                child: 
                widget.paket2 == "free plan"
                ? Center(child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Cblue,
                  ),
                  child: Text('Ayo Berlangganan', style: TextStyle(color: Colors.white),)),)
                : Padding(
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
                                onPressed: () async {
                                  
                                  final snapshot = await FirebaseFirestore.instance.collection('Messages')
                                  .get()
                                  .then((value) {
                                    setState(() {
                                      dc = value.docs.length;
                                    });
                                  });
                                  if (message.text.isNotEmpty) {
                                    fs.collection('Messages').doc(dc.toString()).set({
                                      'message': message.text.trim(),
                                      'time': DateTime.now(),
                                      'email': widget.email,
                                      'mata_pelajaran': widget.materi
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
              Container(child:
              widget.paket2 == "free plan"
                ? Center(child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Cblue,
                  ),
                  child: Text('Ayo Berlangganan', style: TextStyle(color: Colors.white),)),)
              : Quizz(materi: widget.materi)),
              Container(
                child: 
                widget.paket2 == "free plan"
                ? Center(child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Cblue,
                  ),
                  child: Text('Ayo Berlangganan', style: TextStyle(color: Colors.white),)),)
                : ModulLIst(materi: widget.materi),
              ),
            ],
          ),
        ));
  }
}
