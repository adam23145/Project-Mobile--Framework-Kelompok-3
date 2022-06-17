import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scholineid/Container/database_manager.dart';

class profile_get extends StatefulWidget {
  const profile_get({Key? key}) : super(key: key);

  @override
  State<profile_get> createState() => _TestGambarState();
}

class _TestGambarState extends State<profile_get> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: FireStoreDatabase().getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Something wrong");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return CircleAvatar(
                backgroundImage: NetworkImage(snapshot.data.toString()),
              );
            }
            return Text("");
          }),
    );
  }
}
