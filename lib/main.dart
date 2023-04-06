import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/data/models/todo_item.dart';
import 'package:to_do/navigation/home/home_page_bloc.dart';

import 'data/datasource/local/database.dart';
import 'navigation/add_new_task/add_new_task_bloc.dart';

AppDb? db;
void main() {
  db = AppDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  
  MyHomePage({super.key, required this.title});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomePageBloc()
              ..add(HomePageLoadEvent()),
          ),
          BlocProvider(
            create: (context) => AddNewTaskBloc(),
          ),
        ],
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BlocBuilder<HomePageBloc, HomePageState>(
                      builder: (context, state) {
                    if (state is HomePageLoadingState) {
                      return CircularProgressIndicator();
                    }
                    if (state is HomePageLoadedState) {
                      return Column(children: [
                        Container(
                          height: 100,
                          width: 100,
                          color: Colors.green,
                        ),
                        ...state.items.map((e) => Text(e.title))
                      ]);
                    } else
                      return Container(
                          height: 100, width: 100, color: Colors.red);
                  },)
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                final addNewTaskBloc = context.read<AddNewTaskBloc>();
                addNewTaskBloc.add(
                  AddNewTaskToDbEvent(
                    item: ToDoItemModel(
                      id: 1,
                      isDone: true,
                      title: "title",
                      eventDateTime: DateTime.now(),
                    ),
                  ),
                );
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          );
        }));
  }
}
