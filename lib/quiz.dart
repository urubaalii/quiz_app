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
    List<String> selectedAnswers = []; //stores all answers from user

    void chooseAnswer(String answer) { //function to save the answer to the answers array
      selectedAnswers.add(answer);
      if(selectedAnswers.length == questions.length){ //if user answered all questions..
        setState((){
          activeScreen = ResultsScreen( //switch to results screen
            chosenAnswers: selectedAnswers,
            onRestart: restartQuiz,
            ); //constructor for results screen so we can pass the selected answers to it and use it in the results screen
        });
      }
    }

    void restartQuiz(){ //clears answers and sends user back to start screen
      setState((){
        selectedAnswers = [];
        activeScreen = StartScreen(switchScreen);
      });
    }

  Widget? activeScreen; //then switch to questions screen
  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    });
  }
  @override
void initState(){
  activeScreen = StartScreen(switchScreen); //start w start screen
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