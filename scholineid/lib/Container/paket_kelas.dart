import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scholineid/Container/konfirmasi_pembayaran.dart';
import 'package:scholineid/Container/login.dart';
import 'package:scholineid/Container/reusable_widget/reusable_widget.dart';
import 'package:scholineid/warna/constans.dart';

class paketKelas extends StatefulWidget {
  String email =""; 
  paketKelas({Key? key, required this.email}) : super(key: key);

  @override
  State<paketKelas> createState() => _Register2State();
}

class _Register2State extends State<paketKelas> {
  String freeplan = "free plan";
    String personalplan = "personal plan";
    String prooplant = "pro plan";
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfPassword = TextEditingController();
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
                    top: 0,
                    left: 30,
                    child: Image.asset("assets/images/lingkaran.png")),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 45,
                        ),
                        child: Text(
                          "Registration",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 35),
                              child: Text(
                                "Choose your plan",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Color(0xFF1F2050)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 55,
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Color(0xFF98A5FF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Container(
                                                  height: 300,
                                                  width: 100,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 50,
                                                            height: 50,
                                                            child: Image.asset(
                                                                'assets/images/Register2/icon_paket_1.png'),
                                                          ),
                                                          Text("Free Plan")
                                                        ],
                                                      ),
                                                      
                                                      Container(
                                                        child: Text(
                                                            "Suitable for early users to be more familiar with the use of this platform."),
                                                      ),
                                                      SizedBox(height: 20),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            child: Image.asset(
                                                                'assets/images/Register2/x.png'),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Text("Courses")
                                                        ],
                                                      ),
                                                      SizedBox(height: 20),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            child: Image.asset(
                                                                'assets/images/Register2/x.png'),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Text("Certificates")
                                                        ],
                                                      ),
                                                      SizedBox(height: 20),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            child: Image.asset(
                                                                'assets/images/Register2/centang.png'),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Text("Forum Class")
                                                        ],
                                                      ),
                                                      SizedBox(width: 20),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            child: Image.asset(
                                                                'assets/images/Register2/centang.png'),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 10),
                                                              width: 150,
                                                              child: Container(
                                                                child: Text(
                                                                    "Explore learning material videos",),
                                                              ))
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                actions: [
                                                  
                                                  TextButton(
                                                    child: const Text("close"),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  )
                                                ],
                                              );
                                            });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Image.asset(
                                                    "assets/images/Register2/Ellipse.png"),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Image.asset(
                                                    "assets/images/Register2/icon_paket_3.png"),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text(
                                                  "Free Plan",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 5),
                                              child: Image.asset(
                                                  "assets/images/Register2/info.png")),
                                        ],
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Color(0xFF5563EF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Container(
                                                  height: 550,
                                                  width: 100,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 50,
                                                            height: 50,
                                                            child: Image.asset(
                                                                'assets/images/Register2/icon_paket_2.png'),
                                                          ),
                                                          Text("Personal Plan")
                                                        ],
                                                      ),
                                                      Container(
                                                        child: Text(
                                                            "Suitable for users who have just subscribed for the first time to learn about exercises on an online platform."),
                                                      ),
                                                      SizedBox(height: 20),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            child: Image.asset(
                                                                'assets/images/Register2/centang.png'),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Text(
                                                              "1 Courses class")
                                                        ],
                                                      ),
                                                      SizedBox(height: 20),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            child: Image.asset(
                                                                'assets/images/Register2/x.png'),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Text("Certificates")
                                                        ],
                                                      ),
                                                      SizedBox(height: 20),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            child: Image.asset(
                                                                'assets/images/Register2/centang.png'),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Text("Forum Class")
                                                        ],
                                                      ),
                                                      SizedBox(width: 20),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            child: Image.asset(
                                                                'assets/images/Register2/centang.png'),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 10),
                                                              width: 150,
                                                              child: Text(
                                                                  "Premium videos & practice questions"))
                                                        ],
                                                      ),
                                                      SizedBox(width: 20),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            child: Image.asset(
                                                                'assets/images/Register2/centang.png'),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 10),
                                                              width: 150,
                                                              child: Text(
                                                                  "20x school exam tryout"))
                                                        ],
                                                      ),
                                                      SizedBox(width: 20),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            child: Image.asset(
                                                                'assets/images/Register2/centang.png'),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 10),
                                                              width: 150,
                                                              child: Text(
                                                                  "Examples of questions and exercises"))
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: (){
                                                      Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => confPembayaran(email: widget.email, paket: prooplant)));
                                                    }, child: Text("Langganan")),
                                                  TextButton(
                                                    child: const Text("close"),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  )
                                                ],
                                              );
                                            });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Image.asset(
                                                    "assets/images/Register2/Ellipse.png"),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Image.asset(
                                                    "assets/images/Register2/icon_paket_2.png"),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text(
                                                  "Personal Plan",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 5),
                                              child: Image.asset(
                                                  "assets/images/Register2/info.png")),
                                        ],
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Color(0xFFFFA800),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Container(
                                                  height: 550,
                                                  width: 100,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 50,
                                                            height: 50,
                                                            child: Image.asset(
                                                                'assets/images/Register2/icon_paket_1.png'),
                                                          ),
                                                          Text("Pro Plan")
                                                        ],
                                                      ),
                                                      Container(
                                                        child: Text(
                                                            "Suitable for users who want to open all available features to support the learning process."),
                                                      ),
                                                      SizedBox(height: 20),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            child: Image.asset(
                                                                'assets/images/Register2/centang.png'),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Container(
                                                            width: 150,
                                                            child: Text(
                                                                "Unlock all courses class"),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(height: 20),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            child: Image.asset(
                                                                'assets/images/Register2/centang.png'),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Text("Certificates")
                                                        ],
                                                      ),
                                                      SizedBox(height: 20),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            child: Image.asset(
                                                                'assets/images/Register2/centang.png'),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Container(
                                                            width: 150,
                                                            child: Text(
                                                                "12 live class/week sessions"),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(width: 20),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            child: Image.asset(
                                                                'assets/images/Register2/centang.png'),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 10),
                                                              width: 150,
                                                              child: Text(
                                                                  "90k+ premium video"))
                                                        ],
                                                      ),
                                                      SizedBox(width: 20),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            child: Image.asset(
                                                                'assets/images/Register2/centang.png'),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 10),
                                                              width: 150,
                                                              child: Text(
                                                                  "20x school exam tryout with score IRT"))
                                                        ],
                                                      ),
                                                      SizedBox(width: 20),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            child: Image.asset(
                                                                'assets/images/Register2/centang.png'),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 10),
                                                              width: 150,
                                                              child: Text(
                                                                  "A collection of practice questions and their discussions"))
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: (){}, child: Text("Langganan")),
                                                  TextButton(
                                                    child: const Text("close"),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  )
                                                ],
                                              );
                                            });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Image.asset(
                                                    "assets/images/Register2/Ellipse.png"),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Image.asset(
                                                    "assets/images/Register2/icon_paket_1.png"),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text(
                                                  "Pro Plan",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 5),
                                              child: Image.asset(
                                                  "assets/images/Register2/info.png")),
                                        ],
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: 200,
                        height: 55,
                        child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Cblue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            child: Text(
                              "Close",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                      ),
                      SizedBox(height: 40,)
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
