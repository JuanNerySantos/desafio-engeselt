import 'package:flutter/material.dart';
import 'package:marketplace/utils/error/saffold_messenger_error.dart';
import 'package:marketplace/utils/validation/validator_email.dart';
import 'package:marketplace/utils/validation/validator_password.dart';

class ValidateLoginService {
  String email;
  String password;
  BuildContext context;

  ValidateLoginService({
    required this.email,
    required this.password,
    required this.context,
  });

  bool validatorLogin() {
    final email = this.email;
    final password = this.password;
    try {
      validatorEmail(email);

      validatorPassword(password);

      return true;
    } catch (e) {
      messageError(e.toString(), context);
      return false;
    }
  }
}
