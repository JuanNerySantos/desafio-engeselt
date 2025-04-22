bool validatorPassword(String password) {
  final passwordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$.&*~]).{8,}$',
  );

  if (password == "") {
    throw Exception("Campo senha não preenchido");
  }

  if (!passwordRegex.hasMatch(password)) {
    throw Exception(
      "Campo senha não é valido!"
      "\nPelo menos 8 caracteres"
      "\nPelo menos uma letra maiúscula"
      "\nPelo menos uma letra minúscula"
      "\nPelo menos um número"
      "\nPelo menos um caractere especial [!@#\$&*~]",
    );
  }

  return true;
}
