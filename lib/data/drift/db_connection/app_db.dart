import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:marketplace/data/drift/product_data.dart';
import 'package:marketplace/data/drift/store_data.dart';
import 'package:marketplace/utils/list_convert.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, "Storeteste.sqlite"));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [StoreData, Product])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) => m.createAll(),
    onUpgrade: (Migrator m, int from, int to) async {
      if (from == 1) {
        await m.createTable(
          product,
        ); // nome gerado automaticamente para a tabela Product
      }
    },
  );
}
