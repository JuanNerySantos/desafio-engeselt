import 'package:drift/drift.dart';

class StoreData extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nameStore => text().named('name_store')();
  TextColumn get email => text().named('email').unique()();
  TextColumn get latlong => text().named('lat_long')();
  TextColumn get cep => text().named('cep')();
  TextColumn get street => text().named('street')();
  TextColumn get city => text().named('city')();
  TextColumn get neighborhood => text().named('neighborhood')();
  TextColumn get password => text().named('password')();
  TextColumn get phone => text().named('phone')();
  TextColumn get selectedState => text().named('selected_state')();
}
