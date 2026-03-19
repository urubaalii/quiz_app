import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz ({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

  class _QuizState extends State<Quiz> { //saving the data of the quiz in the selected answers array
    List<String> selectedAnswers = [];

    void chooseAnswer(String answer) {
      selectedAnswers.add(answer);
      if(selectedAnswers.length == questions.length){
        setState((){
          //this is going to change. deal with answer screen
          //selectedAnswers = []; //this wont be empty
          activeScreen = ResultsScreen(
            chosenAnswers: selectedAnswers,
            onRestart: restartQuiz,
            ); //constructor for results screen so we can pass the selected answers to it and use it in the results screen
        });
      }
    }

    void restartQuiz(){ //adding function to restart quiz and pass it to results screen so we can call it when the user clicks the restart button
      setState((){
        selectedAnswers = [];
        activeScreen = StartScreen(switchScreen);
      });
    }

  Widget? activeScreen;
  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    });
  }
void initState(){
  activeScreen = StartScreen(switchScreen);
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 63, 8, 165),
            Color.fromARGB(255, 12, 1, 39),
          ],

          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: activeScreen,
        ),
      ),
    );
  }
}