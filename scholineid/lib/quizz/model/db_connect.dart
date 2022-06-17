import 'dart:convert';

import 'package:http/http.dart' as http;
import 'question_model.dart';
import 'package:path/path.dart';

class DBconnect {
  final url = Uri.parse(
      'https://schoolineid-434e8-default-rtdb.firebaseio.com/logaritma.json');
  Future<void> addQuestion(Question question) async {
    http.post(url,
        body: jsonEncode({
          'title': question.title,
          'options': question.options,
        }));
  }

  Future<List<Question>> fetchQuestions(data) async {
    return http.get(
      Uri.parse(
      'https://schoolineid-434e8-default-rtdb.firebaseio.com/${data}.json')
    ).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];

      data.forEach((key, value) {
        var newQuestion = Question(
          id: key,
          title: value['title'],
          options: Map.castFrom(value['options']),
        );
        newQuestions.add(newQuestion);
      });

      return newQuestions;
    });
  }
  // Future<void> fetchQuestions() async {
  //   http.get(url).then((response){
  //     var data =  json.decode(response.body) as Map<String, dynamic>;
  //     List<Question> newQuestions =[];
  //     data.forEach((key, value) {
  //       var newQuestion = Question(
  //         id: key,title: value['title'],
  //         options: Map.castFrom(value['options']),
  //         );
  //         newQuestions.add(newQuestion);
  //     });

  //     print(newQuestions);
  //   });

  // }

}
