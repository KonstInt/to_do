import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/navigation/home/home_page_bloc.dart';
import 'package:to_do/pages/home/adittionals/bottom_bar.dart';
import 'package:to_do/pages/home/header/header_widget.dart';
import 'package:to_do/pages/home/body/home_items_widget.dart';
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
  bool isVisibleFAB = true;

  
  void _onItemTapped(int index) {
    setState(() {
      switch(index){
        case 0:
        homePageBloc.add(HomePageFilterEvent(filterParam: Filter.aZ));
        break;
        case 1:
        homePageBloc.add(HomePageFilterEvent(filterParam: Filter.zA));
        break;
        case 2:
        homePageBloc.add(HomePageFilterEvent(filterParam: Filter.byDate));
        break;
      }
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
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() =>isVisibleFAB=true);
            } else if (notification.direction == ScrollDirection.reverse) {
              setState(()=>isVisibleFAB=false);
            }
            return true;
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const HeaderWidget(),
                  BlocBuilder<HomePageBloc, HomePageState>(
                    builder: (context, state) {
                      if (state is HomePageLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is HomePageEmptyState) {
                        isVisibleFAB=!isVisibleFAB;
                        return const NoItemsWidget();
                      }
                      if (state is HomePageLoadedState) {
                        return HomeItemsWidget(items: state.items);
                      } else {
                        return Container(
                            height: 100, width: 100, color: Colors.red);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: isVisibleFAB ? FloatingActionButtons() : null,
      //floatingActionButtonAnimator: FloatingActionButtonAnimator,
      bottomNavigationBar:
          BottomBar(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
    );
  }
}
