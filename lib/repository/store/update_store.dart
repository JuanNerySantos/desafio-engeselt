import 'package:drift/drift.dart';
import 'package:marketplace/data/drift/db_connection/app_db.dart';

Value<String> _valueOrAbsent(String? value) {
  if (value == null || value.trim().isEmpty) {
    return const Value.absent();
  }
  return Value(value);
}

Future<void> updateStoreRepository(
  AppDb db, {
  required String logged,
  final String? nameStore,
  final String? email,
  final String? latlong,
  final String? cep,
  final String? street,
  final String? city,
  final String? neighborhood,
  final String? password,
  final String? phone,
  final String? selectedState,
}) async {
  final updateFields = StoreDataCompanion(
    email: _valueOrAbsent(email),
    nameStore: _valueOrAbsent(nameStore),
    latlong: _valueOrAbsent(latlong),
    cep: _valueOrAbsent(cep),
    street: _valueOrAbsent(street),
    city: _valueOrAbsent(city),
    neighborhood: _valueOrAbsent(neighborhood),
    password: _valueOrAbsent(password),
    phone: _valueOrAbsent(phone),
    selectedState: _valueOrAbsent(selectedState),
  );

  await (db.update(db.storeData)
    ..where((tbl) => tbl.email.equals(logged))).write(updateFields);
}
