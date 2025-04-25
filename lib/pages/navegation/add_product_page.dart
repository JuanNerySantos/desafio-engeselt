import 'package:flutter/material.dart';
import 'package:marketplace/services/add_product.dart';
import 'package:marketplace/ui/components/text_button_styled.dart';
import 'package:marketplace/ui/components/text_field_styled.dart';
import 'package:marketplace/utils/camera/camera.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final List<String> listPhoto = [];
  final TextEditingController prodctController = TextEditingController(
    text: "",
  );
  final TextEditingController priceController = TextEditingController(text: "");
  final TextEditingController descriptionController = TextEditingController(
    text: "",
  );
  final TextEditingController imageController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Color(0xB5F4D16F),
                  ),
                  onPressed: () async {
                    final String images = await pickImageFromCamera();
                    listPhoto.add(images);
                  },
                  child: Icon(
                    Icons.camera_alt,
                    size: 100,
                    color: Color(0xffc8e6c9),
                  ),
                ),

                SizedBox(height: 20),

                Container(
                  child: TextFieldStyled(
                    hintText: 'Nome do produto',
                    controller: prodctController,
                    obscureText: false,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: TextFieldStyled(
                    hintText: 'Preço',
                    controller: priceController,
                    obscureText: false,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: TextFieldStyled(
                    hintText: 'Descrição',
                    controller: descriptionController,
                    obscureText: false,
                  ),
                ),
                SizedBox(height: 20),

                TextButtonStyled(
                  buttonName: 'Cadastrar produto',
                  onPressed: () async {
                    final product = AddProductService(
                      images: listPhoto,
                      description: descriptionController.text,
                      name: prodctController.text,
                      price: priceController.text,
                      context: context,
                    );

                    await product.insertProduct();
                  },
                  color: Color(0xffc8e6c9),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
