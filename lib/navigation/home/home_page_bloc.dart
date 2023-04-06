import 'dart:io';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/data/models/todo_item.dart';
import 'package:to_do/main.dart';


part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  //final database = Database(NativeDatabase.memory());

   List<ToDoItemModel> listItems = [];
  HomePageBloc() : super(HomePageInitialState()) {
    on<HomePageLoadEvent>(_onLoadEvent);
    on<HomePageHideEvent>(_onHideEvent);
    on<HomePageFilterEvent>(_onFilterEvent);
  }


  _onLoadEvent(event, emit) async {
        emit(HomePageLoadingState());
        try {
          listItems = await db!.parseTodoItemsToTodoItemsModel(db!.allTodoItemsEntries);
          //final tmp = await database.select(database.toDoItemsTable)..get();
          /*for (var element in tmp) {
            listItems.add(ToDoItem(
                id: element.id,
                isDone: element.isDone,
                title: element.title,
                eventDateTime: element.eventDateTime));
          }*/
          emit(HomePageLoadedState(items: listItems));
        } catch (e) {
          if (e == SocketException) {
            emit(HomePageLoadInernetErrorState());
          } else {
            emit(HomePageLoadDatabaseErrorState());
          }
        }
  }

  _onHideEvent(event, emit) async{
    if(event.isHidden) {
        List<ToDoItemModel> tmp = (listItems.where((x) => x.isDone!=true)).toList();
        HomePageLoadedState(items: tmp);
    }
    else {
      HomePageLoadedState(items: listItems);
    }
  }

  _onFilterEvent(event, emit) async{
    switch(event.filterParam){
      case Filter.aZ:
      listItems.sort(((a, b) => a.title.compareTo(b.title)));
      HomePageLoadedState(items: listItems);
      break;
      case Filter.zA:
      listItems.sort(((a, b) => b.title.compareTo(a.title)));
      break;
      case Filter.byDate:
      listItems.sort(((a, b) => a.id.compareTo(a.id)));
      break;
    }
  }
}

enum Filter{
  aZ,
  zA,
  byDate
}