import 'package:flutter/material.dart';
import 'package:marketplace/data/drift/db_connection/app_db.dart';
import 'package:marketplace/repository/get_store_by_email.dart';
import 'package:marketplace/repository/update_store.dart';
import 'package:marketplace/utils/error/saffold_messenger_error.dart'
    show messageError;
import 'package:marketplace/utils/save_email_logged.dart';

class UpdateStoreService {
  final BuildContext context;
  final String? nameStore;
  final String? email;
  final String? latlong;
  final String? cep;
  final String? street;
  final String? city;
  final String? neighborhood;
  final String? password;
  final String? phone;
  final String? selectedState;

  const UpdateStoreService({
    required this.context,
    this.nameStore,
    this.email,
    this.latlong,
    this.cep,
    this.street,
    this.city,
    this.neighborhood,
    this.password,
    this.phone,
    this.selectedState,
  });

  Future<void> updateStore() async {
    try {
      final campos = [
        nameStore,
        email,
        latlong,
        cep,
        street,
        city,
        neighborhood,
        password,
        phone,
        selectedState,
      ];
      final todosVazios = campos.every(
        (campo) => campo == null || campo.trim().isEmpty,
      );

      if (todosVazios) {
        throw Exception("é necessario pelomenso 1 campo preenchido");
      }
      final emailLogged = await getEmailLogged() ?? '';

      final emailExist = await getStoreByEmailRepository(email!);
      print(emailExist);
      print("_____________________________________________________________");
      if (emailExist != null) {
        throw Exception("E-mail já existe");
      }

      updateStoreRepository(
        AppDb(),
        logged: emailLogged,
        cep: cep,
        city: city,
        email: email,
        latlong: latlong,
        nameStore: nameStore,
        neighborhood: neighborhood,
        password: password,
        phone: phone,
        selectedState: selectedState,
        street: street,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Alteração feita com sucxesso!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 4),
        ),
      );
    } catch (e) {
      messageError(e.toString(), context);
    }
  }
}
