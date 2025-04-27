import 'package:flutter/material.dart';
import 'package:marketplace/repository/delete_store.dart';
import 'package:marketplace/repository/get_store_by_email.dart';
import 'package:marketplace/utils/error/saffold_messenger_error.dart';
import 'package:marketplace/utils/save_email_logged.dart';

class DeleteStoreService {
  final BuildContext context;

  DeleteStoreService({required this.context});

  Future<bool> deleteStore() async {
    try {
      final emailLogged = await getEmailLogged() ?? "";
      final store = await getStoreByEmailRepository(emailLogged);
      final id = store?.id;
      if (id == null) {
        throw Exception('Loja não encontrado.');
      }
      await deleteStoreRepository(id);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Loja removida  com sucesso!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 4),
        ),
      );

      return true;
    } catch (e) {
      messageError(e.toString(), context);
      return false;
    }
  }
}
