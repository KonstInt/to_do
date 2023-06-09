import 'package:bloc/bloc.dart';
import 'package:drift/native.dart';
import 'package:meta/meta.dart';
import 'package:drift/drift.dart';
import 'package:to_do/main.dart' show db;
import '../../data/models/todo_item.dart';


part 'add_new_task_event.dart';
part 'add_new_task_state.dart';

class AddNewTaskBloc extends Bloc<AddNewTaskEvent, AddNewTaskState> {
  AddNewTaskBloc() : super(AddNewTaskInitialState()){
    on<AddNewTaskToDbEvent>(_onAddNewTaskToDbEvent);
  }

  _onAddNewTaskToDbEvent(AddNewTaskToDbEvent event, emit) async {
      
      emit(AddNewTaskLoadingState());
      try {
        db!.addTodoItemFromStrings(event.item.title, event.item.isDone, event.item.eventDateTime);
        emit(AddNewTaskLoadedState());
      } catch (e) {
        emit(AddNewTaskFailedState());
      }
  }

  
}
