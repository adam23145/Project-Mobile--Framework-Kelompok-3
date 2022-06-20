import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scholineid/warna/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notifikasi extends StatefulWidget {
  String email = "";
  Notifikasi({Key? key, required this.email}) : super(key: key);

  @override
  State<Notifikasi> createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
        .collection('notifkasi')
        .where('emailpenerima', isEqualTo: widget.email)
        .snapshots();
    return StreamBuilder(
        stream: _messageStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                foregroundColor: Color.fromARGB(255, 16, 69, 112),
                title: Text(
                  "Notifications",
                  textAlign: TextAlign.center,
                ),
              ),
            ));
          }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              foregroundColor: Color.fromARGB(255, 16, 69, 112),
              title: Text("Notifications"),
            ),
            body: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, index) {
                  QueryDocumentSnapshot qs = snapshot.data!.docs[index];
                  Timestamp t = qs['time'];
                  DateTime d = t.toDate();
                  print(d.toString());
                  return MaterialButton(
                    onPressed: () {},
                    child: Container(
                      child: Card(
                        color: Cblue.withOpacity(0.2),
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Column(
                              children: [
                                Text(
                              d.day.toString() +"/"+ d.month.toString() +"/"+d.year.toString(),style: TextStyle(fontSize:10, color: Colors.white),
                            ),
                            SizedBox(height: 10,),
                                Container(
                                    child: Text(
                                  qs['hal'],
                                  style: TextStyle(color: Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          );
        });
  }
}
