import 'package:flutter/material.dart';

class TextFieldStyled extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final IconData? suffixIcon;
  final bool obscureText;

  const TextFieldStyled({
    super.key,
    required this.hintText,
    required this.icon,
    required this.obscureText,
    this.suffixIcon,
  });

  @override
  State<TextFieldStyled> createState() => _TextFieldStyledState();
}

class _TextFieldStyledState extends State<TextFieldStyled> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(176, 244, 209, 111),
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(widget.icon, color: Color(0xff6b4226)),
          suffixIcon:
              widget.suffixIcon != null
                  ? Icon(widget.suffixIcon, color: Color(0xff6b4226))
                  : null,
        ),
      ),
    );
  }
}
