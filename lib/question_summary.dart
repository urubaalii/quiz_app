import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData}); //constructor that takes in the summary data from the results screen and uses it to display the summary of the quiz
  final List<Map<String, Object>> summaryData; //list of maps that contains the question, correct answer, and user answer for each question
@override
Widget build(context){
    return Column(
      children: summaryData.map(
        (data){
          return Row(
            children:[
              Text(((data['question_index'] as int) +1).toString()),
              Expanded(
                child: Column(
                  children:[
                    Text(data['question'] as String),
                    const SizedBox(height:5,),
                    Text(data['user_answer'] as String),
                    Text(data['correct_answer'] as String),
                  ],
                ),
              )
            ],
          );
        }
      ).toList(), //
    );
  }
}