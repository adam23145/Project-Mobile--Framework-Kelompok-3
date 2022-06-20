import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scholineid/warna/constans.dart';

class messages extends StatefulWidget {
  String email;
  String mata_pelajaran;
  String namaGuru;
  messages({required this.email, required this.mata_pelajaran, required this.namaGuru});
  @override
  _messagesState createState() => _messagesState(email: email, mata_pelajaran: mata_pelajaran,namaGuru: namaGuru);
}

class _messagesState extends State<messages> {
  String mata_pelajaran;
  String email;
  String namaGuru;
  _messagesState({required this.email, required this.mata_pelajaran, required this.namaGuru});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection('Messages_private')
      .where('kodechat' ,isEqualTo: '${widget.namaGuru},${widget.email}')
      .snapshots();
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

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          primary: true,
          itemBuilder: (_, index) {
            QueryDocumentSnapshot qs = snapshot.data!.docs[index];
            Timestamp t = qs['time'];
            DateTime d = t.toDate();
            print(d.toString());
            return Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: widget.email == qs['email']
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Cblue.withOpacity(0.4),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70),
                        ),
                        title: Text(
                          qs['email'],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: email == qs['email'] ? Colors.black.withOpacity(0.7) : Cblue,
                          ),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 80,
                              child: Text(
                                qs['message'],
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Text(
                              d.day.toString() +"/"+ d.month.toString() +"/"+d.year.toString(),style: TextStyle(fontSize:10),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
