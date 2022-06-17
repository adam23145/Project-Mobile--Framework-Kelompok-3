import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:scholineid/Container/Dashboard.dart';
import 'package:scholineid/Container/Profile.dart';
import 'package:scholineid/warna/constans.dart';

class mainHome extends StatefulWidget {
  const mainHome({Key? key}) : super(key: key);

  @override
  State<mainHome> createState() => _mainHomeState();
}

class _mainHomeState extends State<mainHome> {
  int _index = 0;
  List<Widget> teks = [MyHomePage(), Profile()];
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            itemCount: 2,
            itemBuilder: (context, position) {
              return Container(
                child: teks[position],
              );
            }),
      ),
      Positioned(
        bottom: 3,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: GNav(
                  iconSize: 15,
                  color: Cblue,
                  activeColor: Colors.white,
                  tabBackgroundColor: Cblue,
                  onTabChange: (index) {
                    setState(() {
                      _index = index;
                    });
                    _controller.jumpToPage(_index);
                  },
                  selectedIndex: _index,
                  gap: 7,
                  tabs: const [
                    GButton(
                      icon: Icons.home,
                      text: 'home',
                      textSize: 10,
                    ),
                    GButton(
                      icon: Icons.people,
                      text: 'akun',
                    ),
                  ]),
            ),
          ),
        ),
      ),
    ]));
  }
}
