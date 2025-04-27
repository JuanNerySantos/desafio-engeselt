import 'package:flutter/material.dart';
import 'package:marketplace/pages/auth/login_page.dart';
import 'package:marketplace/services/delete_store.dart';
import 'package:marketplace/services/update_store.dart';
import 'package:marketplace/ui/components/text_button_styled.dart';
import 'package:marketplace/ui/components/text_field_styled.dart';
import 'package:marketplace/utils/list_states.dart';
import 'package:marketplace/utils/mask_phone.dart';

class ProfileDetailsPage extends StatefulWidget {
  const ProfileDetailsPage({super.key});

  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
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
                controller: nameStoreController,
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

              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButtonStyled(
                      buttonName: "Alterar",
                      color: Color(0xffc8e6c9),
                      onPressed: () async {
                        final update = UpdateStoreService(
                          context: context,
                          cep: cepController.text,
                          city: cityController.text,
                          email: emailController.text,
                          nameStore: nameStoreController.text,
                          latlong: latlongController.text,
                          neighborhood: neighborhoodController.text,
                          password: passwordController.text,
                          phone: controllerPhone.text,
                          selectedState: selectedState,
                          street: streetController.text,
                        );
                        await update.updateStore();
                      },
                    ),

                    InkWell(
                      onTap: () async {
                        final delete = DeleteStoreService(context: context);

                        final storeIsDeleted = await delete.deleteStore();

                        if (storeIsDeleted == true) {
                          setState(() {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginPage();
                                },
                              ),
                            );
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),

                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Text(
                          'Excluir conta',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
