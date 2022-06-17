import 'package:flutter/material.dart';
import '../constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({Key? key, required this.result, required this.questionLength, required this.onPressed}) : super(key: key);

  final int result;
  final int questionLength;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: EdgeInsets.all(70),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Result' ,style: TextStyle(color: neutral),),
            const SizedBox(height: 20,),
            CircleAvatar(
              child: Text('$result/$questionLength', style: TextStyle(fontSize: 30.0),),
              radius: 70,
              backgroundColor: result == questionLength / 2
                    ? Colors.yellow
                    : result < questionLength / 2
                        ? incorrect
                        : correct,
            ),
            const SizedBox(height: 20,),
            Text(result == questionLength / 2
                  ? 'ALmost There'
                  : result < questionLength /2 
                      ? 'Try Again ?'
                      : 'Great',
              style: TextStyle(color: neutral),
            ),
            SizedBox(height: 25,),
            GestureDetector(
              onTap: onPressed,
              child: Text('Start Over', style: TextStyle(color: Colors.blue ,fontSize: 20, letterSpacing: 1.0),),
            )
          ],
        ),
      ),
    );
  }
}
