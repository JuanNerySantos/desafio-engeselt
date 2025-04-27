import 'package:marketplace/data/drift/db_connection/app_db.dart';
import 'package:marketplace/repository/get_product_by_store.dart';
import 'package:marketplace/repository/get_store_by_email.dart';
import 'package:marketplace/utils/save_email_logged.dart';

class GetProductByStoreService {
  Future<List<ProductData>?> getProductByStore() async {
    String email = await getEmailLogged() ?? "";
    StoreDataData? store = await getStoreByEmailRepository(email);
    String id = store?.id.toString() ?? "";
    List<ProductData>? products = await getProductByStoreRepository(id);
    List<ProductData> filterProduct = [];

    for (var product in products) {
      filterProduct.add(product);
    }

    return filterProduct;
  }
}
