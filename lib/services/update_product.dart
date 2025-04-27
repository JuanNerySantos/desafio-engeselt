import 'package:marketplace/repository/update_product.dart';

class UpdateProductService {
  final int id;
  final String? nameProduct;
  final String? price;
  final String? description;
  final List<String>? image;

  UpdateProductService({
    required this.id,
    this.nameProduct,
    this.price,
    this.description,
    this.image,
  });

  void updateProduct() {
    updateProductRepository(
      id,
      description: description,
      image: image,
      nameProduct: nameProduct,
      price: price,
    );
  }
}
