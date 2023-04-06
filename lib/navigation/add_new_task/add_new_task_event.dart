part of 'add_new_task_bloc.dart';

@immutable
abstract class AddNewTaskEvent {}

class AddNewTaskToDbEvent extends AddNewTaskEvent{
    final ToDoItemModel item;
    AddNewTaskToDbEvent({required this.item});
}