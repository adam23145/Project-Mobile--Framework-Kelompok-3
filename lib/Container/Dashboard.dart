import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: size.height * .3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('images/background.png'),
                )),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.only(top: 5)),
                              Text(
                                "Welcome,",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Kelompok 3",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person_outline,
                                color: Colors.black.withOpacity(0.5),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              CircleAvatar(
                                backgroundImage: AssetImage("images/logo.png"),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    margin: EdgeInsets.only(left: 25, right: 25, top: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 40, right: 50,bottom: 8,top: 2),
                            border: InputBorder.none,
                            hintText: "search course",
                            hintStyle: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 73, 73, 73),
                              fontWeight: FontWeight.w600
                            )
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: 11,
                          child: Icon(Icons.search,color: Color.fromARGB(255, 73, 73, 73),))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
