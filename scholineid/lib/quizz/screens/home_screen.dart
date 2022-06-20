import 'package:flutter/material.dart';
import 'package:scholineid/warna/constans.dart';
import '../constants.dart';

import '../model/db_connect.dart';
import '../model/question_model.dart';
import '../widget/next_button.dart';
import '../widget/options_card.dart';
import '../widget/result_box.dart';
import '../widget/widget_question.dart';

class HomeScreen extends StatefulWidget {
  String dataquizz = "";
  HomeScreen({Key? key, required this.dataquizz}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  bool isPressed = false;
  int score = 0;
  bool isAlreadySelected = false;
  // List<Question> _question = [
  //   Question(
  //       id: '10',
  //       title: '2 + 2 = ?',
  //       options: {'5': false, '30': false, '4': true, '10': false}),
  //   Question(
  //       id: '11',
  //       title: '2 + 4 = ?',
  //       options: {'5': false, '30': false, '6': true, '10': false})
  // ];

  var db = DBconnect();

  late Future _questions;

  Future<List<Question>> getData() async {
    return db.fetchQuestions(widget.dataquizz);
  }

  @override
  void initState() {
    _questions = getData();
    super.initState();
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (ctx) => ResultBox(
                result: score,
                questionLength: questionLength,
                onPressed: startOver,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please select any options"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20),
        ));
      }
    }
  }

  void checkAnswerandupdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
        setState(() {
          isPressed = true;
          isAlreadySelected = true;
        });
      } else {
        setState(() {
          isPressed = true;
          isAlreadySelected = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<Question>>,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<Question>;
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text('Quiz App'),
                backgroundColor: Cblue,
                shadowColor: Colors.transparent,
                actions: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Score: $score'),
                  )
                ],
              ),
              body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Column(children: [
                  QuestionsWidget(
                      indexAction: index,
                      question: extractedData[index].title,
                      totalQuestions: extractedData.length),
                  const Divider(
                    color: neutral,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  for (int i = 0; i < extractedData[index].options.length; i++)
                    GestureDetector(
                      onTap: () => checkAnswerandupdate(
                          extractedData[index].options.values.toList()[i]),
                      child: OptionCard(
                        option: extractedData[index].options.keys.toList()[i],
                        color: isPressed
                            ? extractedData[index].options.values.toList()[i] ==
                                    true
                                ? correct
                                : incorrect
                            : neutral,
                      ),
                    ),
                ]),
              ),
              floatingActionButton: GestureDetector(
                onTap: () => isAlreadySelected
                    ? nextQuestion(extractedData.length)
                    : Text("jalo"),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Next(),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          }
        } else {
          return const Center(
            child: Scaffold(
              body:  CircularProgressIndicator(),
            ),
           
          );
        }
        return const Center(
          child: Text('No Data'),
        );
      },
    );
  }
}
