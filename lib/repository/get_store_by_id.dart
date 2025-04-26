import 'package:marketplace/data/drift/db_connection/app_db.dart';

Future<StoreDataData?> getStoreByIdRepository(int id) {
  final db = AppDb();

  return (db.select(db.storeData)
    ..where((u) => u.id.equals(id))).getSingleOrNull();
}
