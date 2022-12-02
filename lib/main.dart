import 'package:flutter/material.dart';

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
        backgroundColor: Colors.grey.shade900,
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
  int questionNumber=0;
  List<bool> myAnswers = [
    true,false,true,false,false
  ];
  List<Icon> myIcons = [
      Icon(Icons.check,color:Colors.lightGreenAccent,),
      Icon(Icons.close,color: Colors.red,)
    ];
  List<String> myQuestions = [
    " A",
    "B",
    "C",
        "D",
        "E",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( backgroundColor: Colors.grey.shade800,
          body: Center(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(flex: 3,
                child: Container(
                  child: Center(child: Text(myQuestions[0],
                    style: TextStyle(color:Colors.white,fontSize: 30),)),
                  color: Colors.grey.shade700,
                ),

              ),
              Expanded(flex:1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(onPressed: (){
                    setState(() {
                      bool correct = myAnswers[questionNumber];
                      if(correct== true){
                        myIcons.add(Icon(Icons.check,color:Colors.green,));
                      }
                      else{
                        myIcons.add(Icon(Icons.close,color: Colors.red,));
                      }
                    
                      questionNumber++;
                    });
                  }, child: Text("True",style: TextStyle(color:Colors.white,fontSize: 30),),
                    style:TextButton.styleFrom(backgroundColor:Colors.green),),
                ),
              ),
              Expanded(flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(onPressed: () {
                    setState(() {
                      questionNumber++;
                    });
                  },

                  child: Text("False",style: TextStyle(color:Colors.white,fontSize: 30),),
                    style:TextButton.styleFrom(backgroundColor:Colors.red),),
                ),
              ),
          Row(
            children:myIcons,
          )
            ],
          ),
        ),
      )
      ),
    );
  }
}
