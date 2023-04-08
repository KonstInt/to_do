part of 'edit_task_bloc.dart';


class EditTaskEvent {
  final ToDoItemModel item;
  int id;
  EditTaskEvent({required this.id, required this.item});
}

