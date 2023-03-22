import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:lazy_realtime_local/models/todo.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:drift/native.dart';

import 'package:drift/drift.dart';

part 'db.g.dart';

@singleton
@DriftDatabase(tables: [Todos])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() =>  LazyDatabase(() async {
    //TODO: CATCH Throws a [MissingPlatformDirectoryException] if the system is unable to provide the directory.
    final dbFolder = await getApplicationDocumentsDirectory();
    final File file = File(join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });

class DatabaseConnection {
  static final DatabaseConnection _singleton = DatabaseConnection._internal();

  factory DatabaseConnection() {
    return _singleton;
  }

  DatabaseConnection._internal();

  MyDatabase _database;

  MyDatabase get database {
    if (_database == null) {
      _database = MyDatabase();
    }
    return _database;
  }
}