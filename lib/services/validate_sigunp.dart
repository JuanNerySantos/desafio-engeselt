import 'package:flutter/material.dart';
import 'package:marketplace/utils/error/saffold_messenger_error.dart';
import 'package:marketplace/utils/validation/validator_email.dart';
import 'package:marketplace/utils/validation/validator_password.dart';
import 'package:marketplace/utils/validation/viladator_field.dart';

class ValidateSigunpService {
  final nameStore;
  final email;
  final latlong;
  final cep;
  final street;
  final city;
  final neighborhood;
  final password;
  final confirmPassword;
  final phone;
  final selectedState;

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

  bool validatorSigunp() {
    try {
      validatorField(nameStore);

      validatorField(latlong);

      validatorField(cep);

      validatorField(street);

      validatorField(city);

      validatorField(neighborhood);

      validatorField(phone);

      print(selectedState);

      if (selectedState == null || selectedState.isEmpty) {
        throw Exception("Todos os campos devem estar preenchidos");
      }

      validatorEmail(email);

      validatorPassword(password);

      return true;
    } catch (e) {
      messageError(e.toString(), context);
      return false;
    }
  }
}
