import 'package:flutter/material.dart';
import 'package:marketplace/data/drift/db_connection/app_db.dart';
import 'package:marketplace/repository/get_product_by_store.dart';
import 'package:marketplace/repository/get_store_by_email.dart';
import 'package:marketplace/utils/error/saffold_messenger_error.dart';
import 'package:marketplace/utils/save_email_logged.dart';

class GetProductByStoreService {
  final BuildContext context;

  GetProductByStoreService({required this.context});
  Future<List<ProductData>?> getProductByStore() async {
    try {
      String email = await getEmailLogged() ?? "";
      StoreDataData? store = await getStoreByEmailRepository(email);
      String id = store?.id.toString() ?? "";
      List<ProductData>? products = await getProductByStoreRepository(id);
      List<ProductData> filterProduct = [];

      for (var product in products) {
        filterProduct.add(product);
      }

      return filterProduct;
    } catch (e) {
      messageError(e.toString(), context);
    }
    return null;
  }
}
