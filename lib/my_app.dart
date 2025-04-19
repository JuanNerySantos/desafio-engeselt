import 'package:flutter/material.dart';
import 'package:marketplace/pages/signup_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 248, 187, 208),
          foregroundColor: Color.fromARGB(
            255,
            106,
            66,
            38,
          ), // cor do texto e ícones
        ),
      ),
      home: SignUpPage(),
    );
  }
}
