import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answer;
  final bool selected;
  final VoidCallback? onPressed;

  const AnswerButton({
    super.key,
    required this.answer,
    required this.onPressed,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              selected ? Colors.blueAccent : Colors.grey[200], // цвет при выборе
          foregroundColor: selected ? Colors.white : Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 23),
            Icon(
              selected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off, // ✅ выбранный вариант
              size: 23,
            ),
            const SizedBox(width: 23),
            Text(
              answer,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}