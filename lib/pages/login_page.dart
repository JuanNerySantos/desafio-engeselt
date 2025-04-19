import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0.8, 1),
              colors: <Color>[Color(0xfff8bbd0), Color(0xfffff3e0)],
            ),
          ),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Container(
                    child: Image.asset("assets/imagens/logo.png", height: 200),
                  ),
                  const Text(
                    "Encontre aqui",
                    style: TextStyle(fontSize: 20, color: Color(0xff6b4226)),
                  ),
                  const Text(
                    "pedaços de bons momentos!",
                    style: TextStyle(fontSize: 20, color: Color(0xff6b4226)),
                  ),
                  const SizedBox(height: 30),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0x3FF4D16F),
                        hintText: "E-mail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.email, color: Color(0xff6b4226)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0x3FF4D16F),
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.lock, color: Color(0xff6b4226)),
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: Color(0xff6b4226),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: TextButton(
                      onPressed: () => {},
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xffc8e6c9),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Color(0xff6b4226)),
                      ),
                    ),
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () => {},
                      child: Text(
                        "Criar conta",
                        style: TextStyle(color: Color(0xff6b4226)),
                      ),
                    ),
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () => {},
                      child: Text(
                        "Esqueci a senha",
                        style: TextStyle(color: Color(0xff6b4226)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
