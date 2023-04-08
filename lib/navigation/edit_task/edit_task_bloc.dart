import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/todo_item.dart';
import 'package:to_do/main.dart' show db;

part 'edit_task_event.dart';
part 'edit_task_state.dart';

class EditTaskBloc extends Bloc<EditTaskEvent, EditTaskState> {
  EditTaskBloc() : super(EditTaskInitial()) {
    on<EditTaskEvent>((event, emit) {
      emit(EditLoadedState());
      try {
        db!.updateTodoItem(event.id, event.item);
        emit(EditLoadedState());
      } catch (Exception) {
        emit(EditFaleState());
      }
    });
  }
}
