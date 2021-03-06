import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scholineid/warna/constans.dart';

class SliderPage extends StatelessWidget {
  late final String title;
  late final String description;
  late final String image;

  SliderPage(
      {required this.title, required this.description, required this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 40,right: 60,top: 100),
              child: Text(
                "Get Started",
                style: TextStyle(fontSize: 20, color: Corange),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                title,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, height: 1.5,letterSpacing: 1),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 60),
            child: Text(
              description,
              style: TextStyle(
                  height: 1.5,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1),
            ),
          ),
          SizedBox(
            height: 200,
          ),
          Image.asset(
            image,
            width: width * 0.6,
          ),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    )
    
  );
  }
}
