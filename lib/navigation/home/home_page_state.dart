part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState{}

class HomePageLoadedWithData extends HomePageState {}

class HomePageLoadedWithoutData extends HomePageState {}

class HomePageLoadDatabaseError extends HomePageState {}

class HomePageLoadInernetError extends HomePageState {}