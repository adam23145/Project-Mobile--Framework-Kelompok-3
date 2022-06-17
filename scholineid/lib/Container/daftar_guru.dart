import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:scholineid/Container/all_guru.dart';
import 'package:scholineid/models/data.dart';

class DataAppGuru extends StatefulWidget {
  const DataAppGuru({Key? key}) : super(key: key);

  @override
  State<DataAppGuru> createState() => _DataAppGuruState();
}

class _DataAppGuruState extends State<DataAppGuru> {
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
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, mainAxisSpacing: 1),
                  padding: EdgeInsets.zero,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        child: Container(
                          height: 71,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  }),
            );
          }
          return Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 34, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Teachers",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    new FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const guru()),
                        );
                      },
                      child: Text("See All"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, mainAxisSpacing: 1),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, index) {
                      QueryDocumentSnapshot qs = snapshot.data!.docs[index];
                      return GestureDetector(
                        child: Container(
                          constraints: const BoxConstraints(
                            maxHeight: 80,
                          ),
                          child: Column(
                            children: [
                              Container(
                                constraints: const BoxConstraints(
                                  minHeight: 50,
                                  minWidth: 50,
                                  maxHeight: 50,
                                  maxWidth: 50,
                                ),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 0.3,
                                      blurRadius: 6,
                                      offset: Offset(
                                          0, 4), // changes position of shadow
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/images/${qs['gambar']}',
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              // Expanded(
                              //   child: Text(
                              //     qs['nama'],
                              //     overflow: TextOverflow.ellipsis,
                              //     style: TextStyle(
                              //         color: Colors.black, fontSize: 10),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          );
        });
  }
}
