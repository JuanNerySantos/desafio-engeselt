import 'package:flutter/material.dart';

class TextFieldStyled extends StatelessWidget {
  final String hintText;
  final TextInputType? textInputType;
  final IconData? icon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const TextFieldStyled({
    super.key,
    required this.hintText,
    this.icon,
    required this.obscureText,
    required this.controller,
    this.onChanged,
    this.suffixIcon,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        keyboardType: textInputType,
        onChanged: onChanged,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xB5F4D16F),
          hintText: hintText,
          prefixIcon: Icon(icon, color: Color(0xff6b4226)),
          suffixIcon:
              suffixIcon != null
                  ? Icon(suffixIcon, color: Color(0xff6b4226))
                  : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
