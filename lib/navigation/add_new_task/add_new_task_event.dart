part of 'add_new_task_bloc.dart';

@immutable
abstract class AddNewTaskEvent {}

class AddNewTaskToDbEvent extends AddNewTaskEvent{
    final ToDoItem item;
    AddNewTaskToDbEvent({required this.item});
}