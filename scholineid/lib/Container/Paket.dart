import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scholineid/Container/paket_kelas.dart';
import 'package:shared_preferences/shared_preferences.dart';

class paket extends StatefulWidget {
  String email = "";
  paket({Key? key, required this.email}) : super(key: key);

  @override
  State<paket> createState() => _paketState();
}

class _paketState extends State<paket> {
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
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => paketKelas(email: widget.email,)));
                },
                child: Container(
                  height: 30,
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 0.1,
                        blurRadius: 3,
                        offset: Offset(0, 4), // changes position of shadow
                      )
                    ],
                  ),
                  child: Center(
                      child: Text(
                    qs['paket'],
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              );
            });
      },
    );
  }
}
