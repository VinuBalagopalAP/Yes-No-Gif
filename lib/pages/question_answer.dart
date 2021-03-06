import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuestionAnswerPage extends StatefulWidget {
  @override
  _QuestionAnswerPageState createState() => _QuestionAnswerPageState();
}

class _QuestionAnswerPageState extends State<QuestionAnswerPage> {
  // Text editing controller for question text field
  TextEditingController _questionFieldController = TextEditingController();

  /// Handle the process of getting ayes/no answer
  _handleGetAnswer() async {
    try {
      http.Response response = await http.get("https://yesno.wtf/api");
      print(response.body);
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
                  labelText: 'Ask a uestion',
                  border: OutlineInputBorder(),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _handleGetAnswer(),
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
