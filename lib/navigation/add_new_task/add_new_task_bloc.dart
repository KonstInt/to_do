import 'package:bloc/bloc.dart';
import 'package:drift/native.dart';
import 'package:meta/meta.dart';
import 'package:drift/drift.dart';
import 'package:to_do/main.dart';
import '../../data/models/todo_item.dart';


part 'add_new_task_event.dart';
part 'add_new_task_state.dart';

class AddNewTaskBloc extends Bloc<AddNewTaskEvent, AddNewTaskState> {
  AddNewTaskBloc() : super(AddNewTaskInitialState()){
    on<AddNewTaskToDbEvent>(_onAddNewTaskToDbEvent);
  }

  _onAddNewTaskToDbEvent(event, emit) async {
      
      emit(AddNewTaskLoadingState());
      try {
        db!.addTodoItemFromStrings("my castom title", false, DateTime.now());
      //final r = await database.into(database.todoItems).insert(TodoItemsCompanion.insert(title: "my tytle", ));
        /*await database.into(database.toDoItemsTable).insert(ToDoItemsTableCompanion.insert(
            isDone: event.item.isDone,
            title: event.item.title,
            eventDateTime: event.item.eventDateTime));
        (await database.select(database.toDoItemsTable).get()).forEach((element) => print(element),);*/
        emit(AddNewTaskLoadedState());
      } catch (e) {
        emit(AddNewTaskFailedState());
      }
  }

  
}
