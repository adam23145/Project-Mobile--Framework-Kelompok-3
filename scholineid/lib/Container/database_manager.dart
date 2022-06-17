


import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class FireStoreDatabase {
  String? downloadURL;


  Future getData() async{
    try{
      await downloadURLExample();
      return downloadURL;
    } catch (e){
      debugPrint('error - $e');
      return null;
    }
  }

  Future<void> downloadURLExample() async{
    downloadURL = await FirebaseStorage.instance
        .ref()
        .child('1.png')
        .getDownloadURL();
    debugPrint(downloadURL.toString());
  }

}