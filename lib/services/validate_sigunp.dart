import 'package:flutter/material.dart';
import 'package:marketplace/repository/get_store_by_email.dart';
import 'package:marketplace/repository/insert_store.dart';
import 'package:marketplace/utils/error/saffold_messenger_error.dart';
import 'package:marketplace/utils/validation/validator_email.dart';
import 'package:marketplace/utils/validation/validator_password.dart';
import 'package:marketplace/utils/validation/viladator_field.dart';

class ValidateSigunpService {
  final String nameStore;
  final String email;
  final String latlong;
  final String cep;
  final String street;
  final String city;
  final String neighborhood;
  final String password;
  final String confirmPassword;
  final String phone;
  final String selectedState;

  BuildContext context;

  ValidateSigunpService({
    required this.nameStore,
    required this.email,
    required this.latlong,
    required this.cep,
    required this.street,
    required this.city,
    required this.neighborhood,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    required this.selectedState,
    required this.context,
  });

  Future<bool> validatorSigunp() async {
    try {
      List isValid = [
        nameStore,
        latlong,
        cep,
        street,
        city,
        neighborhood,
        phone,
        selectedState,
        email,
        password,
      ];

      for (int i = 0; i < isValid.length; i++) {
        validatorField(isValid[i]);
      }

      validatorEmail(email);

      //Validate email exist
      final emailExist = await getStoreByEmailRepository(email);

      if (emailExist != null) {
        throw Exception("O e-mail $email já está em uso!");
      }

      validatorPassword(password);

      if (password != confirmPassword) {
        throw Exception("Os campos senha e confimar senha devem ser iguais");
      }

      if (phone.length != 15) {
        throw Exception("O campo telefone é invalido");
      }

      final insertdb = InsertStoreReository(
        nameStore: nameStore.toString(),
        email: email.toString(),
        latlong: latlong.toString(),
        cep: cep.toString(),
        street: street.toString(),
        city: city.toString(),
        neighborhood: neighborhood.toString(),
        password: password.toString(),
        phone: phone.toString(),
        selectedState: selectedState.toString(),
      );

      await insertdb.insertStoreDb();

      return true;
    } catch (e) {
      messageError(e.toString(), context);
      return false;
    }
  }
}
