import 'package:flutter/material.dart';

class TermsPrivacyPage extends StatefulWidget {
  const TermsPrivacyPage({super.key});

  @override
  State<TermsPrivacyPage> createState() => _TermsPrivacyPageState();
}

class _TermsPrivacyPageState extends State<TermsPrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Termos de uso privacidade")),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 200, horizontal: 80),
        child: Text(
          "Olá me chamo Juan, tenho 20 anos, estudante do curso de Ciência da Computação estou no 3° período, sou uma pessoa bem comunicativa, tenho muita facilidade em lidar com pessoas, trabalho desde os meus 14 anos, tenho facilidade em aprender e muito esforçado, se você leu até aqui muito obrigado !! ",
          style: TextStyle(fontSize: 20, color: Color(0xff6b4226)),
        ),
      ),
    );
  }
}
