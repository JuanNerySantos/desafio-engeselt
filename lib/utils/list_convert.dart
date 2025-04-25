import 'dart:convert';

import 'package:drift/drift.dart';

class ListStringConverter extends TypeConverter<List<String>, String> {
  const ListStringConverter();

  @override
  List<String> fromSql(String fromDb) {
    return List<String>.from(jsonDecode(fromDb));
  }

  @override
  String toSql(List<String> value) {
    return jsonEncode(value);
  }
}
