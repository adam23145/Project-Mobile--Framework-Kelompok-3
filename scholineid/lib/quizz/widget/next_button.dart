import 'package:flutter/material.dart';
import '../constants.dart';


class Next extends StatelessWidget {
  const Next({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(10.0)
      ),
      padding: EdgeInsets.symmetric(vertical:10),
      child: Text(
        'Next Question',
        textAlign: TextAlign.center,
      ),
    );
  }
}