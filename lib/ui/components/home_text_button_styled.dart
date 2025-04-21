import 'package:flutter/material.dart';

class HomeTextButtonStyled extends StatefulWidget {
  final String nameButton;
  final IconData icon;
  final Widget Function() functionPage;
  final Color color;

  const HomeTextButtonStyled({
    super.key,
    required this.nameButton,
    required this.icon,
    required this.functionPage,
    required this.color,
  });

  @override
  State<HomeTextButtonStyled> createState() => _HomeTextButtonStyledState();
}

class _HomeTextButtonStyledState extends State<HomeTextButtonStyled> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:
          () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget.functionPage()),
            ),
          },
      child: Row(
        children: [
          Icon(widget.icon, size: 25, color: widget.color),
          Text(
            widget.nameButton,
            style: TextStyle(fontSize: 20, color: widget.color),
          ),
        ],
      ),
    );
  }
}
