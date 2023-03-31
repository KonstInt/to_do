import 'package:drift/drift.dart';
part 'data.g.dart';


class Notes extends Table{
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get isDone => boolean()();
  TextColumn get title => text()();
  DateTimeColumn get eventDateTime => dateTime()();
}

abstract class NotesView extends View {
    Notes get notes;

    @override 
    Query as() => select([notes.title]).from(notes);
}

@DriftDatabase (tables: [Notes], views:[NotesView])
class Database extends _$Database{
  Database(QueryExecutor e): super(e);

  @override
  int get schemaVersion => 2;
}