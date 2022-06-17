
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scholineid/Container/like_widget.dart';
import 'package:scholineid/models/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class kelas extends StatefulWidget {
  String kelas2 = "";
  String semester = "";
  String materi = "";
  String guru = "";
  String email = "";
  String uid = "";
  int like;
  kelas(
      {Key? key,
      required this.kelas2,
      required this.semester,
      required this.materi,
      required this.guru,
      required this.uid,
      required this.email,
      required this.like})
      : super(key: key);

  @override
  State<kelas> createState() => _paketState();
}

class _paketState extends State<kelas> {
  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final TextEditingController message = new TextEditingController();
  late DocumentReference likeRef;
  bool isLiked = false;
  int count = 0;
  late String uid;
  late int like = widget.like;
  late Map<String, dynamic> data;
  late CollectionReference postRef;
  @override
  void initState() {
    
  late int like = widget.like;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.orange,
              ),
              child: Center(
                  child: Text(
                'Class ${widget.kelas2}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 15),
              )),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.orange,
              ),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Semester ${widget.semester}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              )),
            ),
          ],
        ),
        Row(
          children: [
            MaterialButton(
              onPressed: () async {
                final docSnap = await FirebaseFirestore.instance
                    .collection('like_materi')
                    .doc('${widget.email} ${widget.uid}')
                    .get();
                final doc = docSnap.data();
                if (doc != null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Sudah Like'),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Terima Kasih Sudah Like'),
                  ));
                  fs
                      .collection('daftar_favorit')
                      .doc(widget.uid)
                      .update({"total_like": widget.like + 1});
                  fs
                      .collection('like_materi')
                      .doc('${widget.email} ${widget.uid}')
                      .set({'${widget.uid}': true});
                }
              },
              child: Icon(
                EvaIcons.heart,
                color: Colors.red,
              )
            ),
            Container(
                child: like_widget(
              like: like,
            )),
          ],
        )
      ],
    );
  }
}
