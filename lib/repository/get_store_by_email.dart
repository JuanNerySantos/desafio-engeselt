import 'package:marketplace/data/drift/db_connection/app_db.dart';

Future<StoreDataData?> getStoreByEmailRepository(String email) {
  final db = AppDb();

  return (db.select(db.storeData)
    ..where((u) => u.email.equals(email))).getSingleOrNull();
}
