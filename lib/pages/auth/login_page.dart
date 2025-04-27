import 'package:flutter/material.dart';
import 'package:marketplace/pages/auth/reset_password_page.dart';
import 'package:marketplace/pages/auth/signup_page.dart';
import 'package:marketplace/pages/home/logged_page.dart';
import 'package:marketplace/services/store/validate_login.dart';
import 'package:marketplace/ui/components/password_field.dart';
import 'package:marketplace/ui/components/text_button_styled.dart';
import 'package:marketplace/ui/components/text_field_styled.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController = TextEditingController(
    text: "",
  );

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
                  Image.asset("assets/imagens/logo.png", height: 200),
                  const Text(
                    "Encontre aqui",
                    style: TextStyle(fontSize: 20, color: Color(0xff6b4226)),
                  ),
                  const Text(
                    "pedaços de bons momentos!",
                    style: TextStyle(fontSize: 20, color: Color(0xff6b4226)),
                  ),
                  const SizedBox(height: 30),

                  TextFieldStyled(
                    hintText: "E-mail",
                    icon: Icons.email,
                    obscureText: false,
                    controller: emailController,
                  ),
                  const SizedBox(height: 30),

                  PasswordField(
                    hintText: "Senha",
                    controller: passwordController,
                  ),
                  const SizedBox(height: 30),

                  TextButtonStyled(
                    buttonName: "Login",
                    color: Color(0xffc8e6c9),
                    onPressed: () async {
                      final validate = ValidateLoginService(
                        email: emailController.text,
                        password: passwordController.text,
                        context: context,
                      );
                      bool isValidLogin = await validate.validatorLogin();

                      if (isValidLogin) {
                        setState(() {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoggedPage();
                              },
                            ),
                          );
                        });
                      }
                    },
                  ),

                  TextButtonStyled(
                    buttonName: "Criar conta",
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      });
                    },
                  ),

                  TextButtonStyled(
                    buttonName: "Esqueci a senha",
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPasswordPage(),
                          ),
                        );
                      });
                    },
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
