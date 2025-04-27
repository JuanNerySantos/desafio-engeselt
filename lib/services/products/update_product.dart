import 'package:flutter/widgets.dart';
import 'package:marketplace/repository/products/update_product.dart';
import 'package:marketplace/utils/error/saffold_messenger_error.dart';

class UpdateProductService {
  final int id;
  final BuildContext context;
  final String? nameProduct;
  final String? price;
  final String? description;
  final List<String>? image;

  UpdateProductService({
    required this.id,
    required this.context,
    this.nameProduct,
    this.price,
    this.description,
    this.image,
  });

  void updateProduct() {
    try {
      updateProductRepository(
        id,
        description: description,
        image: image,
        nameProduct: nameProduct,
        price: price,
      );
    } catch (e) {
      messageError(e.toString(), context);
    }
  }
}
