import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scholineid/Container/video.dart';
import 'package:scholineid/quizz/screens/home_screen.dart';
import 'package:shimmer/shimmer.dart';

class Quizz extends StatefulWidget {
  String materi = "";
  Quizz({Key? key, required this.materi}) : super(key: key);

  @override
  State<Quizz> createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
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
            Container(
              padding: EdgeInsets.only(top: 5),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, index) {
                    QueryDocumentSnapshot qs = snapshot.data!.docs[index];
                    return MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(dataquizz: qs['nama_materi'])));
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
          ]);
        });
  }
}
