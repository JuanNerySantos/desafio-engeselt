import 'package:flutter/material.dart';
import 'package:marketplace/repository/get_store_by_email.dart';
import 'package:marketplace/repository/insert_product.dart';
import 'package:marketplace/utils/error/saffold_messenger_error.dart';
import 'package:marketplace/utils/save_email_logged.dart';
import 'package:marketplace/utils/validation/viladator_field.dart';

class AddProductService {
  final List<String> images;
  final String name;
  final String price;
  final String description;
  BuildContext context;

  AddProductService({
    required this.images,
    required this.name,
    required this.price,
    required this.description,
    required this.context,
  });

  Future<void> insertProduct() async {
    try {
      if (images.isEmpty) {
        throw Exception('Campo Imagem não enviado');
      }

      validatorField(price);

      validatorField(description);

      final email = await getEmailLogged();

      final store = await getStoreByEmailRepository(email.toString());

      final id = store?.id.toString();

      final product = InsertProductRepository(
        storeId: id.toString(),
        nameProduct: name,
        price: price,
        description: description,
        images: images,
      );

      await product.insertProduct();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Publicação realizada com sucesso !'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 4),
        ),
      );
    } catch (e) {
      messageError(e.toString(), context);
    }
  }
}
