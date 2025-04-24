import 'package:marketplace/repository/get_store_by_email.dart';

Future<bool> validatorEmail(String email) async {
  final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  final store = await getStoreByEmailRepository(email);

  if (store != null) {
    throw Exception("O e-mail $email já está em uso!");
  }

  if (!emailRegex.hasMatch(email)) {
    throw Exception("Campo e-mail não é valido");
  }

  return true;
}
