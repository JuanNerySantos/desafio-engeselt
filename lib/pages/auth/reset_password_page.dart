import 'package:flutter/material.dart';
import 'package:marketplace/pages/home/logged_page.dart';
import 'package:marketplace/services/store/reset_password.dart';
import 'package:marketplace/ui/components/password_field.dart';
import 'package:marketplace/ui/components/text_button_styled.dart';
import 'package:marketplace/ui/components/text_field_styled.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController = TextEditingController(
    text: "",
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Redefinir Senha")),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    buttonName: "Redefinir senha",
                    color: Color(0xffc8e6c9),
                    onPressed: () async {
                      final reset = ResetPasswordService(
                        context: context,
                        email: emailController.text,
                        newPassword: passwordController.text,
                      );

                      final resetIsValid = await reset.resetPassword();

                      if (resetIsValid) {
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
