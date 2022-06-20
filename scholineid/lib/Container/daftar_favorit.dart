import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:scholineid/Container/App_bar%20Materi.dart';
import 'package:scholineid/Container/like_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:scholineid/Container/favorite.dart';

class DaftarFavorit extends StatefulWidget {
  String email = "";
  DaftarFavorit({Key? key, required this.email}) : super(key: key);

  @override
  State<DaftarFavorit> createState() => _DaftarFavoritState();
}

class _DaftarFavoritState extends State<DaftarFavorit> {
  late String paket2;
  Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection('daftar_favorit')
      .orderBy('total_like', descending: true)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _messageStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 1),
                padding: EdgeInsets.zero,
                itemCount: 2,
                itemBuilder: (BuildContext context, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 150,
                      width: 120,
                      child: Container(
                        color: Colors.grey,
                      ),
                    ),
                  );
                });
          }
          return Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 34, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Favourite Teory",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              QueryDocumentSnapshot qs =
                                  snapshot.data!.docs[index];
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                height: 60,
                                width: 270,
                                child: MaterialButton(
                                  onPressed: () async {
                                    final snapshot = await FirebaseFirestore
                                        .instance
                                        .collection('user')
                                        .where('email', isEqualTo: widget.email)
                                        .get()
                                        .then((QuerySnapshot querySnapshot) {
                                      querySnapshot.docs.forEach((doc) {
                                        return paket2 = doc["paket"];
                                      });
                                    });
                                    paket2 == ""
                                        ? ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                            content: Text(
                                                'Terjadi Kesalahan Pada Paket'),
                                          ))
                                        : Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    appBarMateri(
                                                        paket2: paket2,
                                                        like: qs['total_like'],
                                                        uid: qs['Uid'],
                                                        guru:
                                                            qs['nama_pengajar'],
                                                        email: widget.email,
                                                        kelas: qs['kelas'],
                                                        semester: qs['sem'],
                                                        materi: qs['title'])));
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Column(
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Ink.image(
                                              image: NetworkImage(qs['image']),
                                              height: 150,
                                              fit: BoxFit.cover,
                                            ),
                                            Positioned(
                                              top: 9,
                                              left: 7,
                                              child: TextButton(
                                                  onPressed: () {},
                                                  style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          Color.fromARGB(255,
                                                                  223, 223, 223)
                                                              .withOpacity(0.8),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30))),
                                                  child: Text(
                                                    qs['title'],
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.9),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, top: 10, right: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(qs['title'],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(qs['nama_pengajar'],
                                                      style: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.6)))
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    EvaIcons.heart,
                                                    color: Colors.red,
                                                  ),
                                                  Container(
                                                      child: like_widget(
                                                    like: qs['total_like'],
                                                  ))
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, top: 10, right: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    EvaIcons.people,
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    qs['student'],
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    EvaIcons.book,
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    '${qs['modul']} modules',
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.5)),
                                                  ),
                                                ],
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
            ],
          );
        });
  }
}
