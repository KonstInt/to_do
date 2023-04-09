part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {}

class HomePageInitialState extends HomePageState {}

class HomePageLoadingState extends HomePageState{}

class HomePageLoadedState extends HomePageState {
  final List<ToDoItemModel> items;
  bool isHide;
  HomePageLoadedState({required this.items, required this.isHide});
}

class HomePageEmptyState extends HomePageState{}

class HomePageLoadDatabaseErrorState extends HomePageState {}

class HomePageLoadInernetErrorState extends HomePageState {}