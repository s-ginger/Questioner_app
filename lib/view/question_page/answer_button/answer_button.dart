import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answer;
  final void Function()? onpressed;
  const AnswerButton({
    super.key,
    required this.answer,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.7, // растянуть по ширине
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // скругление углов
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 23,),
            Icon(Icons.check_box_outline_blank, size: 23,), 
            SizedBox(width: 23,),
            Text(
              answer,
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
