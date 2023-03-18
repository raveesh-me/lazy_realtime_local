import 'package:drift/drift.dart' hide JsonKey;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
@freezed
/// Freezed model defines how the object is packaged in memory
class Todo with _$Todo{
  const factory Todo({
    int? id,
    String? title,
    String? description,
    bool? completed,
  }) = _Todo;

  factory Todo.fromJson(json) => _$TodoFromJson(json);
}

/// Also abstracted as DAO in some projects, this is basically how my model is 
/// mapped with the local database. This serves almost the same purpose as fromJson
/// and thus having this in a separate file/layer makes absolutely no sense.
@UseRowClass(Todo)
class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
}


