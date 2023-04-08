import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/pages/home/home_page.dart';

import '../navigation/add_new_task/add_new_task_bloc.dart';
import '../navigation/home/home_page_bloc.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePageBloc(),
        ),
        BlocProvider(
          create: (context) => AddNewTaskBloc(),
        ),
      ],
      child: HomePage(title: "title"));
  }
}