import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NamaDiDashboard extends StatefulWidget {
  String email = "";
  NamaDiDashboard({Key? key, required this.email}) : super(key: key);

  @override
  State<NamaDiDashboard> createState() => _NamaDiDashboardState();
}

class _NamaDiDashboardState extends State<NamaDiDashboard> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
        .collection('user')
        .where('email', isEqualTo: widget.email)
        .snapshots();
    return StreamBuilder(
      stream: _messageStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("something is wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("");
        }
        return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (BuildContext context, index) {
              QueryDocumentSnapshot qs = snapshot.data!.docs[index];
              return Text(qs['nama'],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold));
            });
      },
    );
  }
}
