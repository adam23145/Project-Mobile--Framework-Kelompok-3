import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scholineid/Container/Paket.dart';
import 'package:scholineid/warna/constans.dart';

class confPembayaran extends StatefulWidget {
  String email;
  String paket;
  confPembayaran({Key? key, required this.email, required this.paket})
      : super(key: key);

  @override
  State<confPembayaran> createState() => _confPembayaranState();
}

class _confPembayaranState extends State<confPembayaran> {
   final FirebaseAuth auth = FirebaseAuth.instance;
  final fs = FirebaseFirestore.instance;
  TextEditingController textconfNamaPembayaran = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Color.fromARGB(255, 16, 69, 112),
        title: Text(
          "Konfirmasi Pembayaran",
          overflow: TextOverflow.fade,
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Container(
                  child: Text(
                    widget.paket.toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(child: widget.paket == "personal plan"
              ? Text("Harga Paket Rp.100.000")
              : Text("Harga Paket Rp.200.000")
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  child: Text(
                      "Email di bawah akan berubah menjadi paket ${widget.paket.toUpperCase()}, bisa melakukan pengiriman via GOPAY atau DANA pada nomor")),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  "087861872746",
                  style: TextStyle(color: Colors.red, fontSize: 30),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                  widget.email,
                  style: TextStyle(
                      color: Cblue, fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(child: Text("Nama Pengirim")),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: textconfNamaPembayaran,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Atas Nama',
                  enabled: true,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  
                ),
              ),
              SizedBox(height: 60,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,),
                width: 400,
                height: 55,
                child: TextButton(
                    onPressed: () {
                      if (textconfNamaPembayaran.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Atas Nama Tidak Boleh Kosong'),
                        ));
                      } else {
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Terima Kasih Sudah Membeli, masa berlaku 1 bulan'),
                        ));
                        Navigator.pop(context);
                        fs.collection('confirmasi').doc().set({
                          'email': widget.email,
                          'time': DateTime.now(),
                          'nama': textconfNamaPembayaran.text.trim(),
                          'paket': widget.paket,
                          'status' : 'menunggu_konfirmasi'
                        });
                      }
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Cblue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Text(
                      "Konfirmasi Pembayaran",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
