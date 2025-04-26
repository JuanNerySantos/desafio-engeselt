import 'package:marketplace/data/drift/db_connection/app_db.dart';
import 'package:marketplace/repository/get_all_product.dart';
import 'package:marketplace/repository/get_store_by_id.dart';

class ListProductService {
  Future<List<Map<String, dynamic>>> listProductData() async {
    final products = await getAllProductsRepository();

    print('Total products: ${products.length}');

    List<Map<String, dynamic>> result = [];

    for (var product in products) {
      try {
        final int id = int.tryParse(product.storeId) ?? 0;

        final StoreDataData? store = await getStoreByIdRepository(id);

        result.add({
          'name': product.nameProduct,
          'price': product.price,
          'image': product.image,
          'store': {
            'nameStore': store?.nameStore,
            'cep': store?.cep,
            'city': store?.city,
            'phone': store?.phone,
            'neighborhood': store?.neighborhood,
            'street': store?.street,
          },
        });
      } catch (e) {
        print('Erro ao processar o produto ${product.nameProduct}: $e');
      }
    }

    return result;
  }
}
