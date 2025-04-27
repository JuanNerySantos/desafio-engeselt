import 'package:drift/drift.dart';
import 'package:marketplace/data/drift/db_connection/app_db.dart';

class InsertProductRepository {
  final String storeId;
  final String nameProduct;
  final String description;
  final String price;
  final List<String> images;

  InsertProductRepository({
    required this.nameProduct,
    required this.price,
    required this.storeId,
    required this.images,
    required this.description,
  });

  Future<void> insertProduct() async {
    final db = AppDb();
    db
        .into(db.product)
        .insert(
          ProductCompanion(
            storeId: Value(storeId),
            nameProduct: Value(nameProduct),
            description: Value(description),
            price: Value(price),
            image: Value(images), //
          ),
        );
  }
}
