import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:drift/drift.dart';
import 'package:mobx/mobx.dart';

part 'db_connection_store.g.dart';


const kAppDatabaseName = 'app_db.sqlite';
const kTempDatabaseName = 'temp_db.sqlite';
const kPartialDatabaseName = 'part_db.sqlite';


@lazySingleton
// ignore: library_private_types_in_public_api
class DatabaseConnectionStore = _DatabaseConnectionStoreBase
    with _$DatabaseConnectionStore;

abstract class _DatabaseConnectionStoreBase with Store {
  @observable
  late LazyDatabase lazyDatabase;

  _purgeDatabse() {
    try {
      File file = File(join((getApplicationDocumentsDirectory() as dynamic).path, 'db.sqlite'));
    } catch (e) {
      return;
    }
  }

  _intConnection() {}
}
