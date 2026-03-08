import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;
  
  List<Map<String, Object>> getSummaryData(){   //method creates list of maps-contains the question, correct answer, and user answer for each question
    List<Map<String, Object>> summary = [];     //built this in a for loop
    for(var i = 0; i < chosenAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question': 'questions[i].question',
        'correct_answer': 'questions[i].answers[0]',
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
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
              onPressed: (){},
              child: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
//created questoins summary widget and loaded into results screen