import 'package:drift/drift.dart';
import 'package:marketplace/data/drift/db_connection/app_db.dart';

class InsertStoreReository {
  final String nameStore;
  final String email;
  final String latlong;
  final String cep;
  final String street;
  final String city;
  final String neighborhood;
  final String password;
  final String phone;
  final String selectedState;

  InsertStoreReository({
    required this.nameStore,
    required this.email,
    required this.latlong,
    required this.cep,
    required this.street,
    required this.city,
    required this.neighborhood,
    required this.password,
    required this.phone,
    required this.selectedState,
  });

  Future<bool> insertStoreDb() async {
    final db = AppDb();

    await db
        .into(db.storeData)
        .insert(
          StoreDataCompanion(
            nameStore: Value(nameStore),
            cep: Value(cep),
            city: Value(city),
            email: Value(email),
            latlong: Value(latlong),
            neighborhood: Value(neighborhood),
            password: Value(password),
            phone: Value(phone),
            selectedState: Value(selectedState),
            street: Value(street),
          ),
        );
    return true;
  }
}
