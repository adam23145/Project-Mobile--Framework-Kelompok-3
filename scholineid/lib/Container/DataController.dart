import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseServices {
  static CollectionReference namaCollection =
      FirebaseFirestore.instance.collection('user');

  static Future<DocumentSnapshot> getNama(String nama) async {
    return await namaCollection.doc(nama).get();
  }
}
