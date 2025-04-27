import 'package:marketplace/data/drift/db_connection/app_db.dart';

Future<List<ProductData>> getProductByStoreRepository(String storeId) {
  final db = AppDb();

  return (db.select(db.product)..where((u) => u.storeId.equals(storeId))).get();
}
