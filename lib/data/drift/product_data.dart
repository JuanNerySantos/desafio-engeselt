import 'package:drift/drift.dart';
import 'package:marketplace/utils/list_convert.dart';

class Product extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nameProduct => text().named('name_product')();
  TextColumn get price => text().named('price')();
  TextColumn get storeId => text().named('store_id')();
  TextColumn get image => text().map(const ListStringConverter())();
  TextColumn get description => text().named('description')();
}
