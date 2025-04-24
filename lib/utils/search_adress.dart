import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> searchAdress(String cep) async {
  final url = Uri.parse('https://viacep.com.br/ws/$cep/json/');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final dados = json.decode(response.body);

    if (dados.containsKey('erro')) {
      throw Exception('CEP não encontrado');
    }

    final street = dados['logradouro'];
    final neighborhood = dados['bairro'];
    final city = dados['localidade'];
    final state = dados['uf'];

    return '$street,$neighborhood,$city,$state';
  } else {
    throw Exception('Erro ao buscar endereço');
  }
}
