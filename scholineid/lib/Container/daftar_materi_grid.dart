import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:scholineid/Container/App_bar%20Materi.dart';
import 'package:scholineid/Container/favorite.dart';
import 'package:scholineid/models/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataMateri extends StatefulWidget {
  const DataMateri({Key? key}) : super(key: key);

  @override
  State<DataMateri> createState() => _DataMateriState();
}

class _DataMateriState extends State<DataMateri> {
  String email = "";
  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString('email')!;
    });
  }

  Stream<QuerySnapshot> _messageStream =
      FirebaseFirestore.instance.collection('daftar_categories').snapshots();
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
          return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 5),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, index) {
                QueryDocumentSnapshot qs = snapshot.data!.docs[index];
                return MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => favorite(
                                email: email, materi: qs['title'])));
                  },
                  child: GestureDetector(
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF535BEB),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 4, left: 8, right: 8, bottom: 20),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/svg/${qs['icons']}'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    qs['title'],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
