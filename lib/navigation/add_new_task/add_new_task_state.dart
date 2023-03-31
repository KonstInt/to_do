part of 'add_new_task_bloc.dart';

@immutable
abstract class AddNewTaskState {}

class AddNewTaskInitial extends AddNewTaskState {}

class AddNewTaskLoadingState extends AddNewTaskState {}
class AddNewTaskLoadedState extends AddNewTaskState {}
class AddNewTaskFailedState extends AddNewTaskState {}