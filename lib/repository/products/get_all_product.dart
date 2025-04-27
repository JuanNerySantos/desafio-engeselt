import 'package:marketplace/data/drift/db_connection/app_db.dart';

Future<List<ProductData>> getAllProductsRepository() async {
  final db = AppDb();
  return await db.select(db.product).get();
}
