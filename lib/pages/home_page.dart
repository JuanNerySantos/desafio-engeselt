import 'package:flutter/material.dart';
import 'package:marketplace/pages/login_page.dart';
import 'package:marketplace/pages/profile_details_page.dart';
import 'package:marketplace/pages/terms_privacy_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: Drawer(
          backgroundColor: Color(0xfff8bbd0),
          child: Column(
            children: [
              SizedBox(height: 40),
              TextButton(
                onPressed:
                    () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileDetailsPage(),
                        ),
                      ),
                    },
                child: Row(
                  children: [
                    Icon(Icons.person, size: 25, color: Color(0xff6b4226)),
                    Text(
                      "Dados cadastrais",
                      style: TextStyle(fontSize: 20, color: Color(0xff6b4226)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),

              TextButton(
                onPressed:
                    () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermsPrivacyPage(),
                        ),
                      ),
                    },
                child: Row(
                  children: [
                    Icon(Icons.description, size: 25, color: Color(0xff6b4226)),
                    Text(
                      "Termos de uso e privacidade",
                      style: TextStyle(fontSize: 20, color: Color(0xff6b4226)),
                    ),
                  ],
                ),
              ),

              Spacer(),
              TextButton(
                onPressed:
                    () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      ),
                    },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(Icons.exit_to_app, color: Colors.red, size: 25),
                    SizedBox(width: 8),
                    Text(
                      'Sair do aplicativo',
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(title: Text("DoceHub")),
      ),
    );
  }
}
