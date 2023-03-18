import 'dart:io';
import 'package:lazy_realtime_local/db/todos.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:drift/native.dart';

import 'package:drift/drift.dart';

part 'filename.g.dart';

// class Todos extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get title => text()();
//   TextColumn get content => text().nullable()();
//   TextColumn get category => text().nullable()();
// }

@DataClassName("Catgory")
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

@DriftDatabase(tables: [Todos, Categories])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    //TODO: CATCH Throws a [MissingPlatformDirectoryException] if the system is unable to provide the directory.
    final dbFoler = await getApplicationDocumentsDirectory();
    final File file = File(join(dbFoler.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
