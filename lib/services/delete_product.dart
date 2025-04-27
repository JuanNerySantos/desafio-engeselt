import 'package:marketplace/repository/delete.product.dart';

class DeleteProductService {
  int id;
  DeleteProductService({required this.id});
  Future<void> deleteProduct() async {
    await deleteProductRepository(id);
  }
}
