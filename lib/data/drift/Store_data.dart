import 'package:drift/drift.dart';

class StoreData extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nameStore => text().named('name_store')();
}
