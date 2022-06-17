import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scholineid/Container/Paket.dart';
import 'package:scholineid/Container/kelas,semester.dart';
import 'package:scholineid/Container/video.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class Detail_pelajaran extends StatefulWidget {
  String materi = "";
  String kelas = "";
  String semester = "";
  String guru = "";
  String uid = "";
  int like;
  Detail_pelajaran({Key? key, required this.materi,required this.uid, required this.kelas, required this.semester, required this.guru, required this.like}) : super(key: key);

  @override
  State<Detail_pelajaran> createState() => _Detail_pelajaranState();
}

class _Detail_pelajaranState extends State<Detail_pelajaran> {

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
  String materi2 = "";
  String videoLink = "";
  @override
  Widget build(BuildContext context) {
    setState(() {
      materi2 = widget.materi;
    });

    Stream<QuerySnapshot> _DetailStream = FirebaseFirestore.instance
        .collection('detail_materi')
        .where('mata_pelajaran', isEqualTo: materi2)
        .snapshots();
    return StreamBuilder(
        stream: _DetailStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          }
          return ListView(children: [
            VideoMateri(
              materi: widget.materi,
              detail_materi: videoLink,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(widget.materi, textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20,top: 10),
                      child: kelas(kelas2: widget.kelas, semester: widget.semester,materi: materi2,guru: widget.guru,email: email,uid: widget.uid, like: widget.like,)),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, index) {
                        QueryDocumentSnapshot qs = snapshot.data!.docs[index];
                        return MaterialButton(
                          onPressed: () {
                            setState(() {
                              videoLink = qs['nama_materi'];
                            });
                          },
                          child: Container(
                            height: 80,
                            width: 270,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 10, left: 20),
                                                  child: CircleAvatar(
                                                      radius: 25,
                                                      backgroundImage: AssetImage(
                                                          'assets/images/1.png')),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, top: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                        '${qs['nama_materi']}'),
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                  top: 4),
                                                          child: Text(
                                                              "Mean, Median and Modus"),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ]);
        });
  }
}
