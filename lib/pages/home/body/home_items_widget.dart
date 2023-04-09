import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do/data/models/todo_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/utils/constants.dart';
import '../../../navigation/edit_task/edit_task_bloc.dart';
import '../../../navigation/home/home_page_bloc.dart';

class HomeItemsWidget extends StatelessWidget {
  final List<ToDoItemModel> items;
  const HomeItemsWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return buildItems(items[index], context);
          }),
    );
  }

  Widget buildItems(ToDoItemModel item, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 21.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlocProvider(
            create: (context) => EditTaskBloc(),
            child: Builder(builder: (context) {
              return BlocListener<EditTaskBloc, EditTaskState>(
                listener: (context, state) {
                  if (state is EditLoadedState) {
                    final homeBloc = context.read<HomePageBloc>();
                    homeBloc.add(HomePageLoadEvent());
                  }
                  if (state is EditFaleState) {
                    //print("ПИЗДА ЕБУчий БЛОК");
                  }
                },
                child: SizedBox(
                  height: 20.r,
                  width: 20.r,
                  child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0.r),
                      ),
                      activeColor: MyColors.kPrimaryTextColor,
                      value: item.isDone,
                      onChanged: (bool? value) {
                        final editTaskBloc = context.read<EditTaskBloc>();
                        item.isDone = !item.isDone;
                        editTaskBloc.add(EditTaskEvent(id: item.id, item: item));
                      }),
                ),
              );
            }),
          ),
          SizedBox(width: 13.w,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 250.w,
                child: Text(item.title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          decoration: item.isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: item.isDone
                              ? MyColors.kLighterTextColor
                              : MyColors.kSecondaryTextColor),),
              ),
              SizedBox(height: 5.r,),
              Text(
                DateFormat('dd.MM.yyyy hh:mm').format(item.eventDateTime),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    decoration: item.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: item.isDone
                        ? MyColors.kLighterTextColor
                        : MyColors.kSecondaryTextColor),
              ),
              
            ],
          )
        ],
      ),
    );
  }
}
