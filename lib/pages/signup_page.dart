import 'package:flutter/material.dart';
import 'package:marketplace/utils/list_states.dart';
import 'package:marketplace/utils/widgets/text_button_styled.dart';
import 'package:marketplace/utils/widgets/text_field_styled.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? _selectedState;

  final _controllerPhone = TextEditingController();

  final phoneMask = MaskTextInputFormatter(mask: '(##) #####-####');

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
                  hintText: "Nome da loja",
                  icon: Icons.store,
                  obscureText: false,
                ),
                const SizedBox(height: 20),

                TextFieldStyled(
                  hintText: "Latitude e longitude",
                  icon: Icons.explore,
                  obscureText: false,
                ),
                const SizedBox(height: 20),

                TextFieldStyled(
                  hintText: "CEP",
                  icon: Icons.place,
                  obscureText: false,
                ),
                const SizedBox(height: 20),

                TextFieldStyled(
                  hintText: "Nome da rua(com número)",
                  icon: Icons.edit_location_alt,
                  obscureText: false,
                ),
                const SizedBox(height: 20),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),

                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0x3FF4D16F),
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
                ),
                const SizedBox(height: 20),

                TextFieldStyled(
                  hintText: "Bairro",
                  icon: Icons.location_city,
                  obscureText: false,
                ),
                const SizedBox(height: 20),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: _controllerPhone,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [phoneMask],
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0x3FF4D16F),
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
                  hintText: "Password",
                  icon: Icons.lock,
                  suffixIcon: Icons.visibility,
                  obscureText: true,
                ),
                const SizedBox(height: 20),

                TextFieldStyled(
                  hintText: "Confirm password",
                  icon: Icons.visibility,
                  suffixIcon: Icons.visibility,
                  obscureText: true,
                ),
                const SizedBox(height: 20),

                TextButtonStyled(
                  buttonName: "Cadastrar",
                  backgroundColor: Color(0xffc8e6c9),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
