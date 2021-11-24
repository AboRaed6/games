import 'package:flutter/material.dart';
import 'package:games/app_barin.dart';
import 'package:games/questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

AppBrain appBrain = AppBrain();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExamApp(),
    );
  }
}

class ExamApp extends StatelessWidget {
  const ExamApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'اختبار',
          textAlign: TextAlign.right,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ExamPage(),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answerResult = [];
  int rightAnswer = 0;

  void checkAnswer(bool userPicked) {
    // appBrain.questionGroup[].questionAnswer = false;
    bool currentAnswer = appBrain.getQuestionAnswer();
    setState(() {
      if (userPicked == currentAnswer) {
        rightAnswer++;
        answerResult.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ));
      } else {
        answerResult.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_down,
            color: Colors.red,
          ),
        ));
      }
      if (appBrain.isFinised() == true) {
        Alert(
          context: context,
          title: "انهاء الاختبار",
          desc: "لقد حصلت على $rightAnswer من 7",
          buttons: [
            DialogButton(
              child: Text(
                "ابدا من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        appBrain.reset();
        answerResult = [];
        rightAnswer = 0;
      } else {
        appBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(appBrain.getQuestionImage()),
              SizedBox(
                height: 20,
              ),
              Text(
                appBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: MaterialButton(
            color: Colors.indigo,
            onPressed: () {
              checkAnswer(true);
            },
            child: Text(
              'صح',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: MaterialButton(
            color: Colors.deepOrange,
            onPressed: () {
              checkAnswer(false);
            },
            child: Text(
              'خطأ',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
          ),
        ))
      ],
    );
  }
}
