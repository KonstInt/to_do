import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/pages/home/home_page.dart';
import 'navigation/home/home_page_bloc.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomePageBloc(),
         child: HomePage(title: "title"));
  }
}
