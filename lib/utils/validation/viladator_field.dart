void validatorField(String field) {
  if (field == "") {
    throw Exception("Todos os campos devem estar preenchidos");
  }

  if (field.trim().isEmpty) {
    throw Exception("Campos vazios não são aceitos");
  }
}
