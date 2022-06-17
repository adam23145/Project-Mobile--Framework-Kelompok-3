import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:scholineid/Container/favorite.dart';

class DaftarFavorit extends StatefulWidget {
  const DaftarFavorit({Key? key}) : super(key: key);

  @override
  State<DaftarFavorit> createState() => _DaftarFavoritState();
}

class _DaftarFavoritState extends State<DaftarFavorit> {
  Stream<QuerySnapshot> _messageStream =
      FirebaseFirestore.instance.collection('daftar_favorit').snapshots();
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
                padding: EdgeInsets.only(left: 34, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Favourite Teory",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    new FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const favorite()),
                        );
                      },
                      child: Text("See All"),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
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
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 0.1,
                                      blurRadius: 6,
                                      offset: Offset(
                                          0, 4), // changes position of shadow
                                    )
                                  ],
                                ),
                                height: 60,
                                width: 270,
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
                                                        Color.fromARGB(255, 223,
                                                                223, 223)
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
                                                Text(qs['title']),
                                                Text(qs['nama_pengajar'])
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons
                                                    .heart_broken_outlined),
                                                Text(qs['total_like'])
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
                                                Icon(Icons.people),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(qs['student']),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.book_rounded),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text('${qs['modul']} modules'),
                                              ],
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
            ],
          );
        });
  }
}
