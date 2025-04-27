import 'package:flutter/material.dart';
import 'package:marketplace/data/drift/db_connection/app_db.dart';
import 'package:marketplace/repository/store/get_store_by_email.dart';
import 'package:marketplace/repository/store/update_store.dart';
import 'package:marketplace/utils/error/saffold_messenger_error.dart'
    show messageError;
import 'package:marketplace/utils/validation/validator_password.dart';

class ResetPasswordService {
  final BuildContext context;
  final String email;
  final String newPassword;

  const ResetPasswordService({
    required this.context,
    required this.email,
    required this.newPassword,
  });

  Future<bool> resetPassword() async {
    try {
      final emailExist = await getStoreByEmailRepository(email);
      validatorPassword(newPassword);

      if (emailExist != null) {
        updateStoreRepository(
          AppDb(),
          logged: '',
          cep: '',
          city: '',
          email: '',
          latlong: '',
          nameStore: '',
          neighborhood: '',
          password: newPassword,
          phone: '',
          selectedState: '',
          street: '',
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Alteração feita com sucxesso!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 4),
          ),
        );
        return true;
      }
      throw Exception('E-mail não existe');
    } catch (e) {
      messageError(e.toString(), context);
      return false;
    }
  }
}
