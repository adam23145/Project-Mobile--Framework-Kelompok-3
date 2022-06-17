import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var todaySales = 0;

class like_widget extends StatefulWidget {
  int like;
  like_widget({Key? key, required this.like }) : super(key: key);

  @override
  State<like_widget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<like_widget> {
  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    return Text(
            widget.like.toString(),
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          );
  }}