import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{ //reusable button widget
  const AnswerButton(
    {
      required this.answerText, //must give text for button
      required this.onTap,  //must give function to run when button is clicked
      super.key
    }
  );
   
  final String answerText;
  final void Function() onTap;

  @override
  Widget build(context){
    return 
    ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        backgroundColor: const Color.fromARGB(255, 98, 59, 175),
        foregroundColor: Colors.white,
      ),
      child: Text(answerText, //variable passed in from questions screen
      textAlign: TextAlign.center,
      ),
    );
  }
}