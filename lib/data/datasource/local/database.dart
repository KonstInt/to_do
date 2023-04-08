import 'dart:io';

import 'package:drift/drift.dart';
// These imports are used to open the database
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:to_do/data/datasource/local/todo_items.dart';
import 'package:to_do/data/models/todo_item.dart';


part 'database.g.dart';

@DriftDatabase(
  // relative import for the drift file. Drift also supports `package:`
  // imports
  tables: [TodoItems],
  include: {'todo_items.dart'},
)


class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());
  Future<List<TodoItem>> get allTodoItemsEntries => select(todoItems).get();

  Future<int> addTodoItemFromStrings(String title, bool isDone, DateTime date) {
    return addTodoItem(TodoItemsCompanion(title: Value(title),
        done: Value(isDone),
        date: Value(date),
    ));
  }

  Future<int> addTodoItem(TodoItemsCompanion entry) async {
    return into(todoItems).insert(entry);
  }

  Future<int> updateTodoItem(int id, ToDoItemModel entry)async{
    return (todoItems.update()
            ..where((todo) => todo.id.equals(id)))
          .write( TodoItemsCompanion(title: Value(entry.title), done: Value(entry.isDone), date: Value(entry.eventDateTime)));
  }
  Future<List<ToDoItemModel>> parseTodoItemsToTodoItemsModel(Future<List<TodoItem>> ll) async {
    var rr = await ll;
    return rr.map((it) => ToDoItemModel(id: it.id, title: it.title, isDone: it.done, eventDateTime: it.date ))
        .toList();
  }

  Future<List<TodoItem>> getType(bool type)
  {
    /// TO DO возвращать определенный тип
    return (select(todoItems)..where((tbl) => tbl.done.equals(type))).get();
  }


  // Future<List<ClothesInfo>> getCategory(String category) async {
  //   var ll = await (select(clothes)..where((tbl) => tbl.category.equals(category))).get();
  //   return ll.map((cl) => ClothesInfo(cl.name, cl.category, cl.description)).toList();
  // }





  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}