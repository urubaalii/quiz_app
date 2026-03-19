import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key, 
  required this.chosenAnswers, 
  required this.onRestart,}); //updating const to take in the onRestart function

  final List<String> chosenAnswers;
  final void Function() onRestart; //function that takes no arguments and returns nothing
  
  List<Map<String, Object>> getSummaryData(){   //method creates list of maps and contains the question, correct answer, and user answer for each question
    List<Map<String, Object>> summary = [];     //built this in a for loop -- empty array to put in data
    for(var i = 0; i < chosenAnswers.length; i++){
      summary.add({
        'question_index': i, //index of the question
        'question': questions[i].question, //the question text
        'correct_answer': questions[i].answers[0], //the correct answer is always the first answer in the list of answers for each question because we made sure to put the correct answer first in the questions data
        'user_answer': chosenAnswers[i], //the answer that the user selected for that question
      });
    }
    return summary; //now we have a method that gives us a list of maps with all the data we need to display the results and summary of the quiz
  }

  @override
  Widget build(context)
  {
    final summaryData = getSummaryData();
    final numTotalQuestions = getSummaryData().length;
    final numTotalCorrect = summaryData.where(
    (data){
      return data['correct_answer'] == data['user_answer'];
    }
    ).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text('You answered $numTotalCorrect out of $numTotalQuestions questions Correctly'),
            const SizedBox(height:30,),
            QuestionSummary(summaryData: summaryData), //loop through that summary object
            const SizedBox(height:30,),
            TextButton(
              onPressed: onRestart, //call the onRestart function that we passed in from the quiz screen when user clicks button
              child: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
//created questoins summary widget and loaded into results screen