import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/data/models/todo_item.dart';
import 'package:to_do/main.dart' show db;

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  Filter filterOption = Filter.aZ;
  List<ToDoItemModel> listItems = [];
  List<ToDoItemModel> listTmp = [];
  bool isComlitedHide = false;

  HomePageBloc() : super(HomePageInitialState()) {
    on<HomePageLoadEvent>(_onLoadEvent);
    on<HomePageHideEvent>(_onHideEvent);
    on<HomePageFilterEvent>(_onFilterEvent);
  }


  _onLoadEvent(event, emit) async {
    emit(HomePageLoadingState());
    try {
      listItems =
          await db!.parseTodoItemsToTodoItemsModel(db!.allTodoItemsEntries);
      if (listItems.isNotEmpty) {
        _filterFunction();
        emit(HomePageLoadedState(items: listTmp, isHide: isComlitedHide));
      } else {
        emit(HomePageEmptyState());
        //emit(HomePageLoadedState(items: listItems));
      }
    } catch (e) {
      if (e == SocketException) {
        emit(HomePageLoadInernetErrorState());
      } else {
        emit(HomePageLoadDatabaseErrorState());
      }
    }
  }

  _onHideEvent(event, emit) async {
    emit(HomePageLoadingState());
    isComlitedHide=!isComlitedHide;
    _filterFunction();
    emit(HomePageLoadedState(items: listTmp, isHide: isComlitedHide ));
  }

  _onFilterEvent(event, emit) async {
    emit(HomePageLoadingState());
    filterOption = event.filterParam;
    _filterFunction();
    if (listItems.isNotEmpty) {
      emit(HomePageLoadedState(items: listTmp, isHide: isComlitedHide));
    } else {
      emit(HomePageEmptyState());
    }
  }

  _filterFunction(){
    switch (filterOption) {
      case Filter.aZ:
         listItems.sort(((a, b) => a.title.compareTo(b.title)));
        break;
      case Filter.zA:
        listItems.sort(((a, b) => b.title.compareTo(a.title)));
        break;
      case Filter.byDate:
        listItems.sort(((a, b) => a.eventDateTime.compareTo(b.eventDateTime)));
        break;
    }
    listTmp = listItems.where((element) => !element.isDone).toList() 
    + (isComlitedHide?[]:listItems.where((element) => element.isDone).toList());
       
  }
}

enum Filter { aZ, zA, byDate }
