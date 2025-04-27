import 'package:marketplace/data/drift/db_connection/app_db.dart';

Future<bool> deleteStoreRepository(int id) async {
  final db = AppDb();

  await (db.delete(db.storeData)..where((tbl) => tbl.id.equals(id))).go();

  return true;
}
