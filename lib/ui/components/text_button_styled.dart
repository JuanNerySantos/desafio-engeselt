import 'package:flutter/material.dart';

// Corrige o "Class" para "class"
class TextButtonStyled extends StatelessWidget {
  final String buttonName;
  final Color? color;
  final VoidCallback onPressed; // Adiciona função de callback

  const TextButtonStyled({
    super.key,
    required this.buttonName,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Color(0xff6b4226),
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(buttonName, style: TextStyle(fontSize: 16)),
    );
  }
}
