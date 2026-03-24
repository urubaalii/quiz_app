import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen ({super.key, required this.onSelectedAnswer});

final void Function(String answer) onSelectedAnswer;
@override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
      var currentQuestionIndex = 0; //keeps track of question user is on
      void answerQuestion(String selectedAnswer){
        widget.onSelectedAnswer(selectedAnswer);
        setState(() {
        currentQuestionIndex++;
        //add the answer picked
      });
}

  
  @override
  Widget build(BuildContext context) {

    final currentQuestion = questions[currentQuestionIndex];//pulling current question from index 
    return SizedBox(
      width: double.infinity,
      child: Container( //added container here to add margin to the content
        margin:const EdgeInsets.all(20), //this puts space between edge of screen and the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, //made buttons stretch across the screen
          children: [
            Text(currentQuestion.question,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((item) { //function that creates a list of answer buttons from the list of answers 
              return 
                AnswerButton(answerText: item,
                onTap:(){
                answerQuestion(item);
              });
            })
          ],),
      ),
    );
  }
}