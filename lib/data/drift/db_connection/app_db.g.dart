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
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameStoreMeta =
      const VerificationMeta('nameStore');
  @override
  late final GeneratedColumn<String> nameStore = GeneratedColumn<String>(
      'name_store', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _latlongMeta =
      const VerificationMeta('latlong');
  @override
  late final GeneratedColumn<String> latlong = GeneratedColumn<String>(
      'lat_long', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cepMeta = const VerificationMeta('cep');
  @override
  late final GeneratedColumn<String> cep = GeneratedColumn<String>(
      'cep', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _streetMeta = const VerificationMeta('street');
  @override
  late final GeneratedColumn<String> street = GeneratedColumn<String>(
      'street', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _neighborhoodMeta =
      const VerificationMeta('neighborhood');
  @override
  late final GeneratedColumn<String> neighborhood = GeneratedColumn<String>(
      'neighborhood', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _selectedStateMeta =
      const VerificationMeta('selectedState');
  @override
  late final GeneratedColumn<String> selectedState = GeneratedColumn<String>(
      'selected_state', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        nameStore,
        email,
        latlong,
        cep,
        street,
        city,
        neighborhood,
        password,
        phone,
        selectedState
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'store_data';
  @override
  VerificationContext validateIntegrity(Insertable<StoreDataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name_store')) {
      context.handle(_nameStoreMeta,
          nameStore.isAcceptableOrUnknown(data['name_store']!, _nameStoreMeta));
    } else if (isInserting) {
      context.missing(_nameStoreMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('lat_long')) {
      context.handle(_latlongMeta,
          latlong.isAcceptableOrUnknown(data['lat_long']!, _latlongMeta));
    } else if (isInserting) {
      context.missing(_latlongMeta);
    }
    if (data.containsKey('cep')) {
      context.handle(
          _cepMeta, cep.isAcceptableOrUnknown(data['cep']!, _cepMeta));
    } else if (isInserting) {
      context.missing(_cepMeta);
    }
    if (data.containsKey('street')) {
      context.handle(_streetMeta,
          street.isAcceptableOrUnknown(data['street']!, _streetMeta));
    } else if (isInserting) {
      context.missing(_streetMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('neighborhood')) {
      context.handle(
          _neighborhoodMeta,
          neighborhood.isAcceptableOrUnknown(
              data['neighborhood']!, _neighborhoodMeta));
    } else if (isInserting) {
      context.missing(_neighborhoodMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('selected_state')) {
      context.handle(
          _selectedStateMeta,
          selectedState.isAcceptableOrUnknown(
              data['selected_state']!, _selectedStateMeta));
    } else if (isInserting) {
      context.missing(_selectedStateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StoreDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoreDataData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nameStore: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_store'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      latlong: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lat_long'])!,
      cep: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cep'])!,
      street: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}street'])!,
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city'])!,
      neighborhood: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}neighborhood'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      selectedState: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}selected_state'])!,
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
  final String email;
  final String latlong;
  final String cep;
  final String street;
  final String city;
  final String neighborhood;
  final String password;
  final String phone;
  final String selectedState;
  const StoreDataData(
      {required this.id,
      required this.nameStore,
      required this.email,
      required this.latlong,
      required this.cep,
      required this.street,
      required this.city,
      required this.neighborhood,
      required this.password,
      required this.phone,
      required this.selectedState});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name_store'] = Variable<String>(nameStore);
    map['email'] = Variable<String>(email);
    map['lat_long'] = Variable<String>(latlong);
    map['cep'] = Variable<String>(cep);
    map['street'] = Variable<String>(street);
    map['city'] = Variable<String>(city);
    map['neighborhood'] = Variable<String>(neighborhood);
    map['password'] = Variable<String>(password);
    map['phone'] = Variable<String>(phone);
    map['selected_state'] = Variable<String>(selectedState);
    return map;
  }

  StoreDataCompanion toCompanion(bool nullToAbsent) {
    return StoreDataCompanion(
      id: Value(id),
      nameStore: Value(nameStore),
      email: Value(email),
      latlong: Value(latlong),
      cep: Value(cep),
      street: Value(street),
      city: Value(city),
      neighborhood: Value(neighborhood),
      password: Value(password),
      phone: Value(phone),
      selectedState: Value(selectedState),
    );
  }

  factory StoreDataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoreDataData(
      id: serializer.fromJson<int>(json['id']),
      nameStore: serializer.fromJson<String>(json['nameStore']),
      email: serializer.fromJson<String>(json['email']),
      latlong: serializer.fromJson<String>(json['latlong']),
      cep: serializer.fromJson<String>(json['cep']),
      street: serializer.fromJson<String>(json['street']),
      city: serializer.fromJson<String>(json['city']),
      neighborhood: serializer.fromJson<String>(json['neighborhood']),
      password: serializer.fromJson<String>(json['password']),
      phone: serializer.fromJson<String>(json['phone']),
      selectedState: serializer.fromJson<String>(json['selectedState']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nameStore': serializer.toJson<String>(nameStore),
      'email': serializer.toJson<String>(email),
      'latlong': serializer.toJson<String>(latlong),
      'cep': serializer.toJson<String>(cep),
      'street': serializer.toJson<String>(street),
      'city': serializer.toJson<String>(city),
      'neighborhood': serializer.toJson<String>(neighborhood),
      'password': serializer.toJson<String>(password),
      'phone': serializer.toJson<String>(phone),
      'selectedState': serializer.toJson<String>(selectedState),
    };
  }

  StoreDataData copyWith(
          {int? id,
          String? nameStore,
          String? email,
          String? latlong,
          String? cep,
          String? street,
          String? city,
          String? neighborhood,
          String? password,
          String? phone,
          String? selectedState}) =>
      StoreDataData(
        id: id ?? this.id,
        nameStore: nameStore ?? this.nameStore,
        email: email ?? this.email,
        latlong: latlong ?? this.latlong,
        cep: cep ?? this.cep,
        street: street ?? this.street,
        city: city ?? this.city,
        neighborhood: neighborhood ?? this.neighborhood,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        selectedState: selectedState ?? this.selectedState,
      );
  StoreDataData copyWithCompanion(StoreDataCompanion data) {
    return StoreDataData(
      id: data.id.present ? data.id.value : this.id,
      nameStore: data.nameStore.present ? data.nameStore.value : this.nameStore,
      email: data.email.present ? data.email.value : this.email,
      latlong: data.latlong.present ? data.latlong.value : this.latlong,
      cep: data.cep.present ? data.cep.value : this.cep,
      street: data.street.present ? data.street.value : this.street,
      city: data.city.present ? data.city.value : this.city,
      neighborhood: data.neighborhood.present
          ? data.neighborhood.value
          : this.neighborhood,
      password: data.password.present ? data.password.value : this.password,
      phone: data.phone.present ? data.phone.value : this.phone,
      selectedState: data.selectedState.present
          ? data.selectedState.value
          : this.selectedState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StoreDataData(')
          ..write('id: $id, ')
          ..write('nameStore: $nameStore, ')
          ..write('email: $email, ')
          ..write('latlong: $latlong, ')
          ..write('cep: $cep, ')
          ..write('street: $street, ')
          ..write('city: $city, ')
          ..write('neighborhood: $neighborhood, ')
          ..write('password: $password, ')
          ..write('phone: $phone, ')
          ..write('selectedState: $selectedState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nameStore, email, latlong, cep, street,
      city, neighborhood, password, phone, selectedState);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoreDataData &&
          other.id == this.id &&
          other.nameStore == this.nameStore &&
          other.email == this.email &&
          other.latlong == this.latlong &&
          other.cep == this.cep &&
          other.street == this.street &&
          other.city == this.city &&
          other.neighborhood == this.neighborhood &&
          other.password == this.password &&
          other.phone == this.phone &&
          other.selectedState == this.selectedState);
}

class StoreDataCompanion extends UpdateCompanion<StoreDataData> {
  final Value<int> id;
  final Value<String> nameStore;
  final Value<String> email;
  final Value<String> latlong;
  final Value<String> cep;
  final Value<String> street;
  final Value<String> city;
  final Value<String> neighborhood;
  final Value<String> password;
  final Value<String> phone;
  final Value<String> selectedState;
  const StoreDataCompanion({
    this.id = const Value.absent(),
    this.nameStore = const Value.absent(),
    this.email = const Value.absent(),
    this.latlong = const Value.absent(),
    this.cep = const Value.absent(),
    this.street = const Value.absent(),
    this.city = const Value.absent(),
    this.neighborhood = const Value.absent(),
    this.password = const Value.absent(),
    this.phone = const Value.absent(),
    this.selectedState = const Value.absent(),
  });
  StoreDataCompanion.insert({
    this.id = const Value.absent(),
    required String nameStore,
    required String email,
    required String latlong,
    required String cep,
    required String street,
    required String city,
    required String neighborhood,
    required String password,
    required String phone,
    required String selectedState,
  })  : nameStore = Value(nameStore),
        email = Value(email),
        latlong = Value(latlong),
        cep = Value(cep),
        street = Value(street),
        city = Value(city),
        neighborhood = Value(neighborhood),
        password = Value(password),
        phone = Value(phone),
        selectedState = Value(selectedState);
  static Insertable<StoreDataData> custom({
    Expression<int>? id,
    Expression<String>? nameStore,
    Expression<String>? email,
    Expression<String>? latlong,
    Expression<String>? cep,
    Expression<String>? street,
    Expression<String>? city,
    Expression<String>? neighborhood,
    Expression<String>? password,
    Expression<String>? phone,
    Expression<String>? selectedState,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nameStore != null) 'name_store': nameStore,
      if (email != null) 'email': email,
      if (latlong != null) 'lat_long': latlong,
      if (cep != null) 'cep': cep,
      if (street != null) 'street': street,
      if (city != null) 'city': city,
      if (neighborhood != null) 'neighborhood': neighborhood,
      if (password != null) 'password': password,
      if (phone != null) 'phone': phone,
      if (selectedState != null) 'selected_state': selectedState,
    });
  }

  StoreDataCompanion copyWith(
      {Value<int>? id,
      Value<String>? nameStore,
      Value<String>? email,
      Value<String>? latlong,
      Value<String>? cep,
      Value<String>? street,
      Value<String>? city,
      Value<String>? neighborhood,
      Value<String>? password,
      Value<String>? phone,
      Value<String>? selectedState}) {
    return StoreDataCompanion(
      id: id ?? this.id,
      nameStore: nameStore ?? this.nameStore,
      email: email ?? this.email,
      latlong: latlong ?? this.latlong,
      cep: cep ?? this.cep,
      street: street ?? this.street,
      city: city ?? this.city,
      neighborhood: neighborhood ?? this.neighborhood,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      selectedState: selectedState ?? this.selectedState,
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
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (latlong.present) {
      map['lat_long'] = Variable<String>(latlong.value);
    }
    if (cep.present) {
      map['cep'] = Variable<String>(cep.value);
    }
    if (street.present) {
      map['street'] = Variable<String>(street.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (neighborhood.present) {
      map['neighborhood'] = Variable<String>(neighborhood.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (selectedState.present) {
      map['selected_state'] = Variable<String>(selectedState.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoreDataCompanion(')
          ..write('id: $id, ')
          ..write('nameStore: $nameStore, ')
          ..write('email: $email, ')
          ..write('latlong: $latlong, ')
          ..write('cep: $cep, ')
          ..write('street: $street, ')
          ..write('city: $city, ')
          ..write('neighborhood: $neighborhood, ')
          ..write('password: $password, ')
          ..write('phone: $phone, ')
          ..write('selectedState: $selectedState')
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

typedef $$StoreDataTableCreateCompanionBuilder = StoreDataCompanion Function({
  Value<int> id,
  required String nameStore,
  required String email,
  required String latlong,
  required String cep,
  required String street,
  required String city,
  required String neighborhood,
  required String password,
  required String phone,
  required String selectedState,
});
typedef $$StoreDataTableUpdateCompanionBuilder = StoreDataCompanion Function({
  Value<int> id,
  Value<String> nameStore,
  Value<String> email,
  Value<String> latlong,
  Value<String> cep,
  Value<String> street,
  Value<String> city,
  Value<String> neighborhood,
  Value<String> password,
  Value<String> phone,
  Value<String> selectedState,
});

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
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nameStore => $composableBuilder(
      column: $table.nameStore, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get latlong => $composableBuilder(
      column: $table.latlong, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cep => $composableBuilder(
      column: $table.cep, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get street => $composableBuilder(
      column: $table.street, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get neighborhood => $composableBuilder(
      column: $table.neighborhood, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get selectedState => $composableBuilder(
      column: $table.selectedState, builder: (column) => ColumnFilters(column));
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
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nameStore => $composableBuilder(
      column: $table.nameStore, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get latlong => $composableBuilder(
      column: $table.latlong, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cep => $composableBuilder(
      column: $table.cep, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get street => $composableBuilder(
      column: $table.street, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get neighborhood => $composableBuilder(
      column: $table.neighborhood,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get selectedState => $composableBuilder(
      column: $table.selectedState,
      builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get latlong =>
      $composableBuilder(column: $table.latlong, builder: (column) => column);

  GeneratedColumn<String> get cep =>
      $composableBuilder(column: $table.cep, builder: (column) => column);

  GeneratedColumn<String> get street =>
      $composableBuilder(column: $table.street, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get neighborhood => $composableBuilder(
      column: $table.neighborhood, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get selectedState => $composableBuilder(
      column: $table.selectedState, builder: (column) => column);
}

class $$StoreDataTableTableManager extends RootTableManager<
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
    PrefetchHooks Function()> {
  $$StoreDataTableTableManager(_$AppDb db, $StoreDataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StoreDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StoreDataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StoreDataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nameStore = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> latlong = const Value.absent(),
            Value<String> cep = const Value.absent(),
            Value<String> street = const Value.absent(),
            Value<String> city = const Value.absent(),
            Value<String> neighborhood = const Value.absent(),
            Value<String> password = const Value.absent(),
            Value<String> phone = const Value.absent(),
            Value<String> selectedState = const Value.absent(),
          }) =>
              StoreDataCompanion(
            id: id,
            nameStore: nameStore,
            email: email,
            latlong: latlong,
            cep: cep,
            street: street,
            city: city,
            neighborhood: neighborhood,
            password: password,
            phone: phone,
            selectedState: selectedState,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String nameStore,
            required String email,
            required String latlong,
            required String cep,
            required String street,
            required String city,
            required String neighborhood,
            required String password,
            required String phone,
            required String selectedState,
          }) =>
              StoreDataCompanion.insert(
            id: id,
            nameStore: nameStore,
            email: email,
            latlong: latlong,
            cep: cep,
            street: street,
            city: city,
            neighborhood: neighborhood,
            password: password,
            phone: phone,
            selectedState: selectedState,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StoreDataTableProcessedTableManager = ProcessedTableManager<
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
    PrefetchHooks Function()>;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$StoreDataTableTableManager get storeData =>
      $$StoreDataTableTableManager(_db, _db.storeData);
}
