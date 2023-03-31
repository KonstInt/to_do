import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:drift/native.dart';
import 'package:meta/meta.dart';
import 'package:to_do/data/models/todo_item.dart';
import 'package:to_do/data/repository/data.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final database = Database(NativeDatabase.memory());
  final List<ToDoItem> listItems = [];
  HomePageBloc() : super(HomePageInitial()) {
    // ignore: void_checks
    on<HomePageEvent>((event, emit) async* {
      if (event is HomePageLoad) {
        yield HomePageLoading();
        try {
          for (var element in (await database.select(database.notes).get())) {
            listItems.add(ToDoItem(
                id: element.id,
                isDone: element.isDone,
                title: element.title,
                eventDateTime: element.eventDateTime));
          }
        } catch (e) {
          if (e == SocketException) {
            yield HomePageLoadInernetError();
          } else {
            yield HomePageLoadDatabaseError();
          }
        }
      }
    });
  }
}
