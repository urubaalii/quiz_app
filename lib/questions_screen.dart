import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen ({super.key});

  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState 
extends State<QuestionsScreen> {
  
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[0];
    return SizedBox(
      width: double.infinity,
      child: Container( //added container here to add margin to the content
        margin:const EdgeInsets.all(20), //this puts space between edge of screen and the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, //made buttons stretch across the screen
          children: [
            Text(currentQuestion.question,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.answers.map((item){ //function that creates a list of answer buttons from the list of answers 
              return AnswerButton(answerText: item,
              onTap:(){});
            })
          ],),
      ),
    );
  }
}