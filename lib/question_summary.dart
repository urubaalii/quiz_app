import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData}); //constructor that takes in the summary data from the results screen and uses it to display the summary of the quiz
  final List<Map<String, Object>> summaryData; //list of maps that contains the question, correct answer, and user answer for each question
@override
Widget build(context){
  return SizedBox(
    height: 300,
    child: SingleChildScrollView(
    child: Column(
      children: summaryData.map((data) {
        final isCorrect = data['user_answer'] == data['correct_answer']; //check if the user's answer is correct by comparing it to the correct answer in the summary data
        
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isCorrect
                        ? Colors.blue 
                        : Colors.pink, //if the user's answer is correct, the container will be blue, or it will be pink
                        shape: BoxShape.circle,
                  ),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(), //display the question index in the container, adding 1 to make it 1-based index instead of 0-based
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                ),
                const SizedBox(width: 10), //add some space between the container and the text
            
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(data['question'] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    ),

                    const SizedBox(height: 5),

                    Text(data['user_answer'] as String,
                    style: TextStyle(
                      color: isCorrect 
                      ? Colors.lightBlue
                      : Colors.pinkAccent,
                    ),
                    ),

                    //correct answer (if wrong)
                    if (!isCorrect)
                    Text(data['correct_answer'] as String,
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                    ),
                  ],
                ),
              )
            ],
            ),
          );
        }
      ).toList(), 
    ),
    ),
    );
}
}