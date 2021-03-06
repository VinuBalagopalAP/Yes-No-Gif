import 'package:flutter/material.dart';
import 'package:trial/pages/question_answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Trial',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: QuestionAnswerPage(),
    );
  }
}
