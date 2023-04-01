import 'package:bloc/bloc.dart';
import 'package:drift/native.dart';
import 'package:meta/meta.dart';
import 'package:to_do/data/models/todo_item.dart';

import '../../data/repository/data.dart';

part 'add_new_task_event.dart';
part 'add_new_task_state.dart';

class AddNewTaskBloc extends Bloc<AddNewTaskEvent, AddNewTaskState> {
  final database = Database(NativeDatabase.memory());
  AddNewTaskBloc() : super(AddNewTaskInitialState()){
    on<AddNewTaskToDbEvent>(_onAddNewTaskToDbEvent);
  }

  _onAddNewTaskToDbEvent(event, emit) async* {
    
      emit(AddNewTaskLoadingState());
      try {
        await database.into(database.notes).insert(NotesCompanion.insert(
            isDone: event.item.isDone,
            title: event.item.title,
            eventDateTime: event.item.eventDateTime));
        emit(AddNewTaskLoadedState());
      } catch (e) {
        emit(AddNewTaskFailedState());
      }
  }

  
}
