import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Suporte")),
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            Container(height: 200),
            Text(
              "E-mail:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff6b4226),
              ),
            ),
            Text(
              "suporte@gmail.com",
              style: TextStyle(fontSize: 20, color: Color(0xff6b4226)),
            ),
            SizedBox(height: 15),

            Text(
              "Telefone:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff6b4226),
              ),
            ),
            Text(
              "Telefone para contato",
              style: TextStyle(fontSize: 20, color: Color(0xff6b4226)),
            ),
            SizedBox(height: 50),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Para qualquer dúvida ou reclamação, entre em contato através do nossos canais de suporte",
                style: TextStyle(fontSize: 20, color: Color(0xff6b4226)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
