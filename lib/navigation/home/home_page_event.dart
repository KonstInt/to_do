part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {}

class HomePageLoadEvent extends HomePageEvent{

}

class HomePageUpdateEvent extends HomePageEvent{}

class HomePageHideEvent extends HomePageEvent {
  HomePageHideEvent();
}

class HomePageFilterEvent extends HomePageEvent {
  final Filter filterParam;
  HomePageFilterEvent({required this.filterParam});
}

