import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scholineid/Container/App_bar%20Materi.dart';
import 'package:scholineid/Container/Paket.dart';
import 'package:scholineid/Container/favorite.dart';
import 'package:shimmer/shimmer.dart';
import 'package:scholineid/Container/all_material.dart';
import 'package:scholineid/models/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataAppMenu extends StatefulWidget {
  String email;
  DataAppMenu({Key? key, required this.email}) : super(key: key);

  @override
  State<DataAppMenu> createState() => _DataAppMenuState();
}

class _DataAppMenuState extends State<DataAppMenu> {
  late Map<String, dynamic> data;
  late String imagepath;
  Stream<QuerySnapshot> _messageStream =
      FirebaseFirestore.instance.collection('daftar_categories').snapshots();

  final ref = FirebaseStorage.instance.ref().child('register2').child('3.png');
  late String paket;
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
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                    Text(
                      "Categories",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    new FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllMateri()),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, mainAxisSpacing: 3),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, index) {
                      QueryDocumentSnapshot qs = snapshot.data!.docs[index];
                      return MaterialButton(
                        onPressed: () async {
                          final snapshot = await FirebaseFirestore.instance
                              .collection('user')
                              .where('email', isEqualTo: widget.email)
                              .get()
                              .then((QuerySnapshot querySnapshot) {
                            querySnapshot.docs.forEach((doc) {
                              return paket = doc["paket"];
                            });
                          });
                          print(paket);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => favorite(
                                    paket2: paket,
                                      email: widget.email,
                                      materi: qs['title'])));
                        },
                        child: GestureDetector(
                          child: Container(
                            constraints: const BoxConstraints(
                              maxHeight: 101,
                            ),
                            child: Column(
                              children: [
                                Container(
                                    constraints: const BoxConstraints(
                                      minHeight: 50,
                                      minWidth: 50,
                                      maxHeight: 65,
                                      maxWidth: 65,
                                    ),
                                    child: SvgPicture.asset(
                                        'assets/images/svg/${qs['icons']}')),
                                Expanded(
                                  child: Text(
                                    qs['title'],
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
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
