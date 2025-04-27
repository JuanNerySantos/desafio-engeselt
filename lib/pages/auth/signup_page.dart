import 'package:flutter/material.dart';
import 'package:marketplace/pages/home/logged_page.dart';
import 'package:marketplace/services/store/validate_sigunp.dart';
import 'package:marketplace/ui/components/password_field.dart';
import 'package:marketplace/ui/components/text_button_styled.dart';
import 'package:marketplace/ui/components/text_field_styled.dart';
import 'package:marketplace/utils/list_states.dart';
import 'package:marketplace/utils/localization/get_coodinates.dart';
import 'package:marketplace/utils/mask_phone.dart';
import 'package:marketplace/utils/search_adress.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? _selectedState;

  List<String> adressList = [];
  String latLng = '';
  String streetHint = "Rua";
  String neighborhoodHint = "Bairro";
  String cityHint = "Cidade";
  String stateHint = "Estado";

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

  List<Map<String, String>> authCreate = [];

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
                  icon: Icons.email,
                  obscureText: false,
                  controller: emailController,
                ),
                const SizedBox(height: 20),

                TextFieldStyled(
                  hintText: "CEP",
                  icon: Icons.place,
                  obscureText: false,
                  controller: cepController,
                  onChanged: (cepController) async {
                    if (cepController.length == 8) {
                      String adress = await searchAdress(cepController);
                      adressList = adress.split(',');
                      final latLngExist = await getCoordinatesFromCep(
                        cepController,
                      );
                      latLng = latLngExist!;

                      setState(() {
                        if (brazilianStates.contains(adressList[3])) {
                          _selectedState = adressList[3];
                          stateHint = adressList[3];
                        } else {
                          _selectedState = null;
                          stateHint = "Estado";
                        }

                        streetHint = adressList[0];
                        streetController.text = adressList[0];

                        neighborhoodController.text = adressList[1];
                        neighborhoodHint = adressList[1];

                        cityController.text = adressList[2];
                        cityHint = adressList[2];
                      });
                    }
                  },
                ),
                const SizedBox(height: 20),

                TextFieldStyled(
                  hintText: streetHint,
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
                      labelText: stateHint,
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
                    onChanged: (newValue) {
                      setState(() {
                        _selectedState = newValue;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),

                TextFieldStyled(
                  hintText: cityHint,
                  icon: Icons.location_city,
                  obscureText: false,
                  controller: cityController,
                ),
                const SizedBox(height: 20),

                TextFieldStyled(
                  hintText: neighborhoodHint,
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

                PasswordField(
                  hintText: "Senha",
                  controller: passwordController,
                ),
                const SizedBox(height: 20),

                PasswordField(
                  hintText: "Confirmar seha",
                  controller: confirmPasswordController,
                ),
                const SizedBox(height: 20),

                TextButtonStyled(
                  buttonName: "Cadastrar",
                  color: Color(0xffc8e6c9),
                  onPressed: () async {
                    final validate = ValidateSigunpService(
                      nameStore: nameStoreController.text,
                      email: emailController.text,
                      latlong: latLng.toString(),
                      cep: cepController.text,
                      street:
                          streetController.text.isEmpty
                              ? streetHint
                              : streetController.text,
                      city:
                          cityController.text.isEmpty
                              ? cityHint
                              : cityController.text,
                      neighborhood:
                          neighborhoodController.text.isEmpty
                              ? neighborhoodHint
                              : neighborhoodController.text,
                      password: passwordController.text,
                      confirmPassword: confirmPasswordController.text,
                      phone: controllerPhone.text,
                      selectedState: _selectedState ?? "",
                      context: context,
                    );
                    bool validateIstrue = await validate.validatorSigunp();

                    if (validateIstrue) {
                      setState(() {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoggedPage()),
                        );
                      });
                    }
                    authCreate.clear();
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
