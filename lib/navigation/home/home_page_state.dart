part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {}

class HomePageInitialState extends HomePageState {}

class HomePageLoadingState extends HomePageState{}

class HomePageLoadedState extends HomePageState {
  final List<ToDoItem> items;
  HomePageLoadedState({required this.items});
}

class HomePageLoadDatabaseErrorState extends HomePageState {}

class HomePageLoadInernetErrorState extends HomePageState {}