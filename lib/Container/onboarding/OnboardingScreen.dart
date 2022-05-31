import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tugas_akhir/Container/Dashboard.dart';
import 'package:tugas_akhir/Container/login.dart';
import 'package:tugas_akhir/Container/onboarding/slider.dart';
import 'package:tugas_akhir/warna/constans.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
      title: "Learn everywhere",
      description:
          "Learn online that you can access wherever you are to support your comfort.",
      image: 'assets/images/OnBoarding/1.svg',
    ),
    SliderPage(
      title: "Stay connected",
      description:
          "Stay connected with your teacher or with your group members to dicsuss something",
      image: 'assets/images/OnBoarding/2.svg',
    ),
    SliderPage(
      title: "Communication",
      description:
          "Communication services are available between teachers to support learning activities.",
      image: 'assets/images/OnBoarding/3.svg',
    )
  ];

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              itemCount: _pages.length,
              onPageChanged: _onChanged,
              itemBuilder: (context, int index) {
                return _pages[index];
              }),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 10,
                      width: (index == _currentPage) ? 30 : 10,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (index == _currentPage)
                              ? Colors.blue
                              : Colors.blue.withOpacity(0.5)),
                    );
                  })),
              InkWell(
                onTap: () {
                  (_currentPage == (_pages.length - 1))
                  ? 
                  (_currentPage == 1 )
                  ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()))
                  : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()))
                  : _controller.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(
                    duration: Duration(microseconds: 300),
                    
                    height: 50,
                    alignment: Alignment.center,
                    width: (_currentPage == (_pages.length - 1)) ? 300 : 300,
                    decoration: BoxDecoration(
                      color: Cblue,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: (_currentPage == (_pages.length - 1))
                        ? Text(
                            "Get Started",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        :  Text(
                            "Next",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
