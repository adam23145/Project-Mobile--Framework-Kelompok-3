import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scholineid/Container/messagesPrivate/messages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class messagePrivate extends StatefulWidget {
  String materi ="";
  String namaGuru ="";
  messagePrivate({Key? key, required this.materi, required this.namaGuru}) : super(key: key);

  @override
  State<messagePrivate> createState() => _messagePrivateState();
}

class _messagePrivateState extends State<messagePrivate> {
  String email = "";

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString('email')!;
    });
  }

  @override
  void initState() {
    print(email);
    // TODO: implement initState
    super.initState();
    getEmail();
  }
  late int dc;
  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final TextEditingController message = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                foregroundColor: Color.fromARGB(255, 16, 69, 112),
        title: Text(
          widget.namaGuru,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.79,
              child: messages(
                email: email, mata_pelajaran: widget.materi, namaGuru: widget.namaGuru,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: message,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'message',
                      enabled: true,
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      
                    ),
                    validator: (value) {},
                    onSaved: (value) {
                      message.text = value!;
                    },
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final snapshot = await FirebaseFirestore.instance.collection('Messages_private')
                                  .get()
                                  .then((value) {
                                    setState(() {
                                      dc = value.docs.length;
                                    });
                                  });
                    if (message.text.isNotEmpty) {
                      fs.collection('Messages_private').doc(dc.toString()).set({
                        'message': message.text.trim(),
                        'time': DateTime.now(),
                        'email': email,
                        'kodechat' : '${widget.namaGuru},${email}',
                      });

                      message.clear();
                    }
                  },
                  icon: Icon(Icons.send_sharp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
