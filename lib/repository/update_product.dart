import 'package:drift/drift.dart';
import 'package:marketplace/data/drift/db_connection/app_db.dart';

Future<void> updateProductRepository(
  int id, {
  String? nameProduct,
  String? price,
  String? description,
  List<String>? image,
}) async {
  final db = AppDb();

  final updateFields = ProductCompanion(
    nameProduct:
        nameProduct != null && nameProduct.isNotEmpty
            ? Value(nameProduct)
            : const Value.absent(),
    price:
        price != null && price.isNotEmpty ? Value(price) : const Value.absent(),
    description:
        description != null && description.isNotEmpty
            ? Value(description)
            : const Value.absent(),
    image:
        image != null && image.isNotEmpty ? Value(image) : const Value.absent(),
  );

  await (db.update(db.product)
    ..where((tbl) => tbl.id.equals(id))).write(updateFields);
}
