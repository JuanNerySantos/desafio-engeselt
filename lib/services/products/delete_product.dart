import 'package:marketplace/repository/products/delete_product.dart';

class DeleteProductService {
  int id;
  DeleteProductService({required this.id});
  Future<void> deleteProduct() async {
    await deleteProductRepository(id);
  }
}
