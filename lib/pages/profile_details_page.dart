import 'package:flutter/material.dart';
import 'package:marketplace/ui/components/auth_text_button_styled.dart';
import 'package:marketplace/ui/components/text_field_styled.dart';
import 'package:marketplace/utils/list_states.dart';
import 'package:marketplace/utils/mask_phone.dart';

class ProfileDetailsPage extends StatefulWidget {
  const ProfileDetailsPage({super.key});

  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  @override
  Widget build(BuildContext context) {
    String? selectedState;

    return Scaffold(
      appBar: AppBar(title: Text("Alterar Dados cadastrais")),
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
                  value: selectedState,
                  items:
                      brazilianStates.map((String state) {
                        return DropdownMenuItem(
                          value: state,
                          child: Text(state),
                        );
                      }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedState = newValue;
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
                  controller: controllerPhone,
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
                hintText: "Senha",
                icon: Icons.lock,
                suffixIcon: Icons.visibility,
                obscureText: true,
              ),
              const SizedBox(height: 20),

              AuthTextButtonStyled(
                buttonName: "Alterar",
                backgroundColor: Color(0xffc8e6c9),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
