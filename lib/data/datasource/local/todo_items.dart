import 'package:drift/drift.dart';

// part 'notes.g.dart';

class TodoItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1,max: 500)();
  BoolColumn get done => boolean()();
  DateTimeColumn get date => dateTime()();
}