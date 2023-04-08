part of 'edit_task_bloc.dart';

@immutable
abstract class EditTaskState {}

class EditTaskInitial extends EditTaskState {}
class EditLoadingState extends EditTaskState {}
class EditLoadedState extends EditTaskState {}
class EditFaleState extends EditTaskState {}