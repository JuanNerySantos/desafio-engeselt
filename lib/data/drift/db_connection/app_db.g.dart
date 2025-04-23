// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $StoreDataTable extends StoreData
    with TableInfo<$StoreDataTable, StoreDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoreDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameStoreMeta = const VerificationMeta(
    'nameStore',
  );
  @override
  late final GeneratedColumn<String> nameStore = GeneratedColumn<String>(
    'name_store',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nameStore];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'store_data';
  @override
  VerificationContext validateIntegrity(
    Insertable<StoreDataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name_store')) {
      context.handle(
        _nameStoreMeta,
        nameStore.isAcceptableOrUnknown(data['name_store']!, _nameStoreMeta),
      );
    } else if (isInserting) {
      context.missing(_nameStoreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StoreDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoreDataData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      nameStore:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name_store'],
          )!,
    );
  }

  @override
  $StoreDataTable createAlias(String alias) {
    return $StoreDataTable(attachedDatabase, alias);
  }
}

class StoreDataData extends DataClass implements Insertable<StoreDataData> {
  final int id;
  final String nameStore;
  const StoreDataData({required this.id, required this.nameStore});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name_store'] = Variable<String>(nameStore);
    return map;
  }

  StoreDataCompanion toCompanion(bool nullToAbsent) {
    return StoreDataCompanion(id: Value(id), nameStore: Value(nameStore));
  }

  factory StoreDataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoreDataData(
      id: serializer.fromJson<int>(json['id']),
      nameStore: serializer.fromJson<String>(json['nameStore']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nameStore': serializer.toJson<String>(nameStore),
    };
  }

  StoreDataData copyWith({int? id, String? nameStore}) =>
      StoreDataData(id: id ?? this.id, nameStore: nameStore ?? this.nameStore);
  StoreDataData copyWithCompanion(StoreDataCompanion data) {
    return StoreDataData(
      id: data.id.present ? data.id.value : this.id,
      nameStore: data.nameStore.present ? data.nameStore.value : this.nameStore,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StoreDataData(')
          ..write('id: $id, ')
          ..write('nameStore: $nameStore')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nameStore);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoreDataData &&
          other.id == this.id &&
          other.nameStore == this.nameStore);
}

class StoreDataCompanion extends UpdateCompanion<StoreDataData> {
  final Value<int> id;
  final Value<String> nameStore;
  const StoreDataCompanion({
    this.id = const Value.absent(),
    this.nameStore = const Value.absent(),
  });
  StoreDataCompanion.insert({
    this.id = const Value.absent(),
    required String nameStore,
  }) : nameStore = Value(nameStore);
  static Insertable<StoreDataData> custom({
    Expression<int>? id,
    Expression<String>? nameStore,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nameStore != null) 'name_store': nameStore,
    });
  }

  StoreDataCompanion copyWith({Value<int>? id, Value<String>? nameStore}) {
    return StoreDataCompanion(
      id: id ?? this.id,
      nameStore: nameStore ?? this.nameStore,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nameStore.present) {
      map['name_store'] = Variable<String>(nameStore.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoreDataCompanion(')
          ..write('id: $id, ')
          ..write('nameStore: $nameStore')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $StoreDataTable storeData = $StoreDataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [storeData];
}

typedef $$StoreDataTableCreateCompanionBuilder =
    StoreDataCompanion Function({Value<int> id, required String nameStore});
typedef $$StoreDataTableUpdateCompanionBuilder =
    StoreDataCompanion Function({Value<int> id, Value<String> nameStore});

class $$StoreDataTableFilterComposer
    extends Composer<_$AppDb, $StoreDataTable> {
  $$StoreDataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameStore => $composableBuilder(
    column: $table.nameStore,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StoreDataTableOrderingComposer
    extends Composer<_$AppDb, $StoreDataTable> {
  $$StoreDataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameStore => $composableBuilder(
    column: $table.nameStore,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StoreDataTableAnnotationComposer
    extends Composer<_$AppDb, $StoreDataTable> {
  $$StoreDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nameStore =>
      $composableBuilder(column: $table.nameStore, builder: (column) => column);
}

class $$StoreDataTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $StoreDataTable,
          StoreDataData,
          $$StoreDataTableFilterComposer,
          $$StoreDataTableOrderingComposer,
          $$StoreDataTableAnnotationComposer,
          $$StoreDataTableCreateCompanionBuilder,
          $$StoreDataTableUpdateCompanionBuilder,
          (
            StoreDataData,
            BaseReferences<_$AppDb, $StoreDataTable, StoreDataData>,
          ),
          StoreDataData,
          PrefetchHooks Function()
        > {
  $$StoreDataTableTableManager(_$AppDb db, $StoreDataTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$StoreDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$StoreDataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$StoreDataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nameStore = const Value.absent(),
              }) => StoreDataCompanion(id: id, nameStore: nameStore),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nameStore,
              }) => StoreDataCompanion.insert(id: id, nameStore: nameStore),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StoreDataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $StoreDataTable,
      StoreDataData,
      $$StoreDataTableFilterComposer,
      $$StoreDataTableOrderingComposer,
      $$StoreDataTableAnnotationComposer,
      $$StoreDataTableCreateCompanionBuilder,
      $$StoreDataTableUpdateCompanionBuilder,
      (StoreDataData, BaseReferences<_$AppDb, $StoreDataTable, StoreDataData>),
      StoreDataData,
      PrefetchHooks Function()
    >;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$StoreDataTableTableManager get storeData =>
      $$StoreDataTableTableManager(_db, _db.storeData);
}
