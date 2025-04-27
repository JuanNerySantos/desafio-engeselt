import 'package:marketplace/data/drift/db_connection/app_db.dart';

Future<List<StoreDataData>> getAllStoreRepository() async {
  final db = AppDb();
  return await db.select(db.storeData).get();
}
