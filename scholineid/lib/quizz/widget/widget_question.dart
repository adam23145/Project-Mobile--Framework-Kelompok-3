import 'package:flutter/material.dart';
import '../constants.dart';

class QuestionsWidget extends StatelessWidget {
  const QuestionsWidget(
      {Key? key,
      required this.question,
      required this.indexAction,
      required this.totalQuestions})
      : super(key: key);

  final String question;
  final int indexAction;
  final int totalQuestions;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'Question${indexAction + 1}/$totalQuestions:',
              style:
                  TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Text(
              '$question',
              style:
                  TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.6)),
            ),
          )
        ],
      ),
    ); // Container
  }
}
