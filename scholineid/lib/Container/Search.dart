import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:scholineid/Container/App_bar%20Materi.dart';
import 'package:scholineid/Container/favorite.dart';
import 'package:scholineid/models/data.dart';
import 'package:scholineid/warna/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Search extends StatefulWidget {
  String email;
  Search({Key? key, required this.email}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();

  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Cblue,
          title: Card(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                ),
                hintText: 'Search',
              ),
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              },
            ),
          )),
      body: StreamBuilder<QuerySnapshot>(
          stream: (name != "" && name != null)
              ? FirebaseFirestore.instance
                  .collection('daftar_categories')
                  .where('title', isGreaterThanOrEqualTo: name.toLowerCase())
                  .where('title', isLessThan: name.toLowerCase() + 'z')
                  .snapshots()
              : FirebaseFirestore.instance
                  .collection('daftar_categories')
                  .snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      return MaterialButton(
                        onPressed: () {
                          print(data['title']);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => favorite(
                                      email: widget.email,
                                      materi: data['title'])));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 16),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(data['title']),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
          }),
    );
  }
}
