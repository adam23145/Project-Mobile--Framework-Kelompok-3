import 'package:flutter/material.dart';
import 'package:scholineid/Container/daftar_materi_grid.dart';

class AllMateri extends StatefulWidget {
  const AllMateri({Key? key}) : super(key: key);

  @override
  State<AllMateri> createState() => _AllMateriState();
}

class _AllMateriState extends State<AllMateri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                      top: 48,
                      left: 10,
                      child: new FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFF1F2050),
                        ),
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Text(
                          "All Class",
                          style: TextStyle(
                              color: Color(0xFF1F2050),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 70),
                        child: Text(
                          "What do you want to learn?",
                          style: TextStyle(
                              color: Color(0xFF1F2050),
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40, left: 80, right: 80),
                        child: Text(
                          "Choose the subject you want to start the course!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF1F2050).withOpacity(0.4),
                              fontSize: 14),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 50, left: 10, right: 10),
                            child: Container(child: DataMateri()),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Container(
                      //   padding: EdgeInsets.symmetric(horizontal: 20),
                      //   width: 190,
                      //   height: 48,
                      //   child: TextButton(
                      //       onPressed: () {
                      //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                      //       },
                      //       style: TextButton.styleFrom(
                      //           backgroundColor: Cblue,
                      //           shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(30))),
                      //       child: Text(
                      //         "Back",
                      //         style:
                      //             TextStyle(color: Colors.white, fontSize: 18),
                      //       )),
                      // ),
                      SizedBox(
                        height: 50,
                      ),
                    ]),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
