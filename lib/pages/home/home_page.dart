import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/data/models/todo_item.dart';
import 'package:to_do/navigation/home/home_page_bloc.dart';
import 'package:to_do/pages/home/add_bottom_shit.dart';
import 'package:to_do/pages/home/adittionals/bottom_bar.dart';
import 'package:to_do/pages/home/header_widget.dart';
import 'package:to_do/pages/home/body/home_items_widget.dart';
import 'package:to_do/pages/info_page.dart';
import 'package:to_do/utils/constants.dart';

import '../../navigation/add_new_task/add_new_task_bloc.dart';
import 'adittionals/floating_buttons.dart';
import 'body/no_items_widget.dart';


class HomePage extends StatefulWidget {
  final String title;
  HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageBloc homePageBloc;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      homePageBloc.add(HomePageFilterEvent(filterParam: Filter.aZ));
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    homePageBloc = context.read<HomePageBloc>();
    homePageBloc.add(HomePageLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HeaderWidget(),
              BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
                  if (state is HomePageLoadingState) {
                    return const CircularProgressIndicator();
                  }
                  if (state is HomePageEmptyState) {
                    return const NoItemsWidget();
                  }
                  if (state is HomePageLoadedState) {
                    return HomeItemsWidget(items: state.items);
                  } else {
                    return Container(
                        height: 100, width: 100, color: Colors.red);
                  }
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButtons(),
      bottomNavigationBar: BottomBar(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
    );
  }
}
