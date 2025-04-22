import 'package:flutter/material.dart';
import 'package:marketplace/pages/home_page.dart';
import 'package:marketplace/ui/components/text_button_styled.dart';
import 'package:marketplace/ui/components/text_field_styled.dart';
import 'package:marketplace/utils/list_states.dart';
import 'package:marketplace/utils/mask_phone.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? _selectedState;

  final TextEditingController nameStoreController = TextEditingController(
    text: "",
  );

  final TextEditingController emailController = TextEditingController(text: "");

  final TextEditingController latlongController = TextEditingController(
    text: "",
  );
  final TextEditingController cepController = TextEditingController(text: "");
  final TextEditingController streetController = TextEditingController(
    text: "",
  );
  final TextEditingController cityController = TextEditingController(text: "");
  final TextEditingController neighborhoodController = TextEditingController(
    text: "",
  );
  final TextEditingController passwordController = TextEditingController(
    text: "",
  );
  final TextEditingController confirmPasswordController = TextEditingController(
    text: "",
  );

  List authCreate = [];

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
            child: Column(
              children: [
                SizedBox(height: 30),
                Text(
                  "Casdastre-se",
                  style: TextStyle(fontSize: 30, color: Color(0xff6b4226)),
                ),
                const SizedBox(height: 20),

                TextFieldStyled(
                  controller: nameStoreController,
                  hintText: "Nome da loja",
                  icon: Icons.store,
                  obscureText: false,
                ),
                const SizedBox(height: 20),

                TextFieldStyled(
                  hintText: "E-mail",
                  icon: Icons.store,
                  obscureText: false,
                  controller: emailController,
                ),
                const SizedBox(height: 20),

                TextFieldStyled(
                  hintText: "Latitude e longitude",
                  icon: Icons.explore,
                  obscureText: false,
                  controller: latlongController,
                ),
                const SizedBox(height: 20),

                TextFieldStyled(
                  hintText: "CEP",
                  icon: Icons.place,
                  obscureText: false,
                  controller: cepController,
                ),
                const SizedBox(height: 20),

                TextFieldStyled(
                  hintText: "Nome da rua(com número)",
                  icon: Icons.edit_location_alt,
                  obscureText: false,
                  controller: streetController,
                ),
                const SizedBox(height: 20),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),

                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xB5F4D16F),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      labelText: "Estado",
                      prefixIcon: Icon(Icons.map, color: Color(0xff6b4226)),
                    ),
                    value: _selectedState,
                    items:
                        brazilianStates.map((String state) {
                          return DropdownMenuItem(
                            value: state,
                            child: Text(state),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedState = newValue;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),

                TextFieldStyled(
                  hintText: "Cidade",
                  icon: Icons.location_city,
                  obscureText: false,
                  controller: cityController,
                ),
                const SizedBox(height: 20),

                TextFieldStyled(
                  hintText: "Bairro",
                  icon: Icons.location_city,
                  obscureText: false,
                  controller: neighborhoodController,
                ),
                const SizedBox(height: 20),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: controllerPhone,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [phoneMask],
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xB5F4D16F),
                      hintText: "Telefone",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.phone, color: Color(0xff6b4226)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                TextFieldStyled(
                  hintText: "Senha",
                  icon: Icons.lock,
                  suffixIcon: Icons.visibility,
                  obscureText: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 20),

                TextFieldStyled(
                  hintText: "Confirmar seha",
                  icon: Icons.visibility,
                  suffixIcon: Icons.visibility,
                  obscureText: true,
                  controller: confirmPasswordController,
                ),
                const SizedBox(height: 20),

                TextButtonStyled(
                  buttonName: "Cadastrar",
                  color: Color(0xffc8e6c9),
                  onPressed: () {
                    authCreate.addAll([
                      nameStoreController.text,
                      latlongController.text,
                      cepController.text,
                      streetController.text,
                      cityController.text,
                      neighborhoodController.text,
                      passwordController.text,
                      confirmPasswordController.text,
                      controllerPhone,
                      _selectedState,
                    ]);
                    setState(() {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    });
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
