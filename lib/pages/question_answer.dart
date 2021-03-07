import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trial/models/answer.dart';

class QuestionAnswerPage extends StatefulWidget {
  @override
  _QuestionAnswerPageState createState() => _QuestionAnswerPageState();
}

class _QuestionAnswerPageState extends State<QuestionAnswerPage> {
  // Text editing controller for question text field

  TextEditingController _questionFieldController = TextEditingController();

  /// To store the current answer object

  Answer _currentAnswer;

  /// Handle the process of getting ayes/no answer
  _handleGetAnswer() async {
    try {
      http.Response response =
          await http.get(Uri.parse("https://yesno.wtf/api"));
      if (response.statusCode == 200 && response.body != null) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        Answer answer = Answer.fromMap(responseBody);
        setState(() {
          _currentAnswer = answer;
        });
      }
    } catch (err, stacktrace) {
      print(err);
      print(stacktrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Trial"),
        elevation: 0,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 0.5 * MediaQuery.of(context).size.width,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Ask a question',
                  border: OutlineInputBorder(),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          if (_currentAnswer != null)
            Container(
              height: 250,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(_currentAnswer.image),
                ),
              ),
            ),
          if (_currentAnswer != null)
            SizedBox(
              height: 20,
            ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _handleGetAnswer,
                  child: Text("Get Answer"),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Reset"),
                )
              ]),
        ],
      ),
    );
  }
}
