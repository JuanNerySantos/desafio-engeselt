import 'package:flutter/material.dart';

class TextButtonStyled extends StatelessWidget {
  final String buttonName;
  final Color? backgroundColor;
  const TextButtonStyled({
    super.key,
    required this.buttonName,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextButton(
        onPressed: () => {},
        style: TextButton.styleFrom(backgroundColor: backgroundColor),
        child: Text(buttonName, style: TextStyle(color: Color(0xff6b4226))),
      ),
    );
  }
}
