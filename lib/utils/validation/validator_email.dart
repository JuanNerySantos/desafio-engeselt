bool validatorEmail(String email) {
  final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  if (email == "") {
    throw Exception("Campo e-mail não preenchido");
  }

  if (!emailRegex.hasMatch(email)) {
    throw Exception("Campo e-mail não é valido");
  }

  return true;
}
