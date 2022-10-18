import 'package:flutter/material.dart';
import 'package:quizzlerapp/questions.dart';
import 'Questionbank.dart';

Quizbrain quizbrain = Quizbrain();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

Icon checkIcon() {
  return const Icon(
    Icons.check,
    color: Colors.green,
  );
}

Icon falseIcon() {
  return const Icon(
    Icons.clear,
    color: Colors.red,
  );
}

List<Icon> myIcons = [checkIcon(), falseIcon()];

// List<Questions> questionBank = [
//   Questions("did he ?", true),
//   Questions("has he ?", false),
//   Questions("have he ?", false)
// ];

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizbrain.getQuestionText(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: Text("True"),
              onPressed: () {
                bool correctanswer = quizbrain.getQeustionNumber();
                if (correctanswer) {
                  print("correctanswer");
                } else {
                  print("wrong answer");
                }
                setState(() {
                  quizbrain.nextQuestion();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: Text("False"),
              onPressed: () {
                bool correctanswer = quizbrain.getQeustionNumber();
                if (correctanswer == false) {
                  print("correctanswer");
                } else {
                  print("wrong answer");
                }
                setState(() {
                  quizbrain.nextQuestion();
                });
              },
            ),
          ),
        ),
        Row(children: myIcons)
      ],
    );
  }
}
