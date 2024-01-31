import 'package:flutter/material.dart';
import 'QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


QuizBrain quiz_brain = QuizBrain();


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soru-Cevap',
      home: Scaffold(
       body:SafeArea(
child:QuizPage()
    ),
      ),
    );
  }
}
class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}
class _QuizPageState extends State<QuizPage> {
  void isCorrect(bool playerPick) {
    bool correct = quiz_brain.getAnswer();
    setState(() {
      if (quiz_brain.isFinished()) {
        Alert(
          context: context,
          type: AlertType.success,
          title: "Finished",
          desc: "Press the button for play again!",
          buttons: [
            DialogButton(
              child: Text(
                "RESET",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: (){
                setState(() {
                  quiz_brain.reset();
                  myIcons = [];
                });
                Navigator.pop(context);

              },
              width: 120,
            )
          ],
        ).show();


      } else {
        if (playerPick == correct) {
          myIcons.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          myIcons.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }

        quiz_brain.nextQuestion();
      }
    });
  }

  List<Icon> myIcons = [];


    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(flex: 4,
                      child: Center(
                        child: Container(
                          margin:EdgeInsets.all(8),
                          child: Text(quiz_brain.getText(),
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          color: Colors.white24,
                        ),
                      ),
                    ),
                    Expanded(flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                         child: Text("True", style: TextStyle(
                            color: Colors.white, fontSize: 30),
                          ),
                        onPressed: () {
                          isCorrect(true);
                        },
                      ),
                    ),
              ),
                    Expanded(flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: Text(
                            'False',
                            style: TextStyle(
                              color: Colors.white, fontSize: 30)
                          ),
                          onPressed: () {
                            isCorrect(false);
                          },
                        ),
                      ),
                    ),
                    Row(
                      children: myIcons,
                    ),
                  ],
        ),
      ),
      ))
      );
    }
}