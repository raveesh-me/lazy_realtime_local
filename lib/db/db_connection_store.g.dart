// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_connection_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DatabaseConnectionStore on _DatabaseConnectionStoreBase, Store {
  late final _$lazyDatabaseAtom =
      Atom(name: '_DatabaseConnectionStoreBase.lazyDatabase', context: context);

  @override
  LazyDatabase get lazyDatabase {
    _$lazyDatabaseAtom.reportRead();
    return super.lazyDatabase;
  }

  @override
  set lazyDatabase(LazyDatabase value) {
    _$lazyDatabaseAtom.reportWrite(value, super.lazyDatabase, () {
      super.lazyDatabase = value;
    });
  }

  @override
  String toString() {
    return '''
lazyDatabase: ${lazyDatabase}
    ''';
  }
}
