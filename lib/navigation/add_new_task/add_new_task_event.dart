part of 'add_new_task_bloc.dart';

@immutable
abstract class AddNewTaskEvent {}

class AddNewTaskToDb extends AddNewTaskEvent{
    ToDoItem item;
    AddNewTaskToDb({required this.item});
}