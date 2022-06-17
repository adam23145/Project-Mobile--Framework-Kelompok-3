

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';


class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Row(
              children: [
                Icon(Icons.home_max_outlined),
                Icon(Icons.people_alt_outlined)
              ],
            ),
          )
        ],
      ),
    );
  }
}