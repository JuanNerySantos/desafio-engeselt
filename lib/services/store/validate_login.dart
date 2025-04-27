import 'package:flutter/material.dart';
import 'package:marketplace/repository/store/get_store_by_email.dart';
import 'package:marketplace/utils/error/saffold_messenger_error.dart';
import 'package:marketplace/utils/save_email_logged.dart';
import 'package:marketplace/utils/validation/validator_email.dart';

class ValidateLoginService {
  String email;
  String password;
  BuildContext context;

  ValidateLoginService({
    required this.email,
    required this.password,
    required this.context,
  });

  Future<bool> validatorLogin() async {
    final email = this.email;
    final password = this.password;
    try {
      validatorEmail(email);

      final store = await getStoreByEmailRepository(email);

      if (store?.password.toString() != password) {
        throw Exception("E-mail ou senha está incorreto");
      }

      await saveEmailLogged(email);

      return true;
    } catch (e) {
      messageError(e.toString(), context);
      return false;
    }
  }
}
