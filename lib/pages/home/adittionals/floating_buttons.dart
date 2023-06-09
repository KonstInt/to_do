import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/navigation/add_new_task/add_new_task_bloc.dart';

import '../../../navigation/home/home_page_bloc.dart';
import '../../../utils/constants.dart';
import '../../info/info_page.dart';
import '../bottom_sheet/add_bottom_shit.dart';

class FloatingActionButtons extends StatelessWidget {
  const FloatingActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 42.r,
            height: 42.r,
            child: FittedBox(
              child: FloatingActionButton(
                heroTag: "info",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const InfoPage()));
                },
                backgroundColor: MyColors.kPrimaryTextColor,
                child: SvgPicture.asset(
                  "assets/icons/info_icon.svg",
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 42.r,
            height: 42.r,
            child: FittedBox(
              child: FloatingActionButton(
                heroTag: "add",
                onPressed: () {
                  /*final addNewTaskBloc = context.read<AddNewTaskBloc>();
                    addNewTaskBloc.add(
                      AddNewTaskToDbEvent(
                        item: ToDoItemModel(
                          id: 1,
                          isDone: true,
                          title: "title",
                          eventDateTime: DateTime.now(),
                        ),
                      ),
                    );*/
                  //() {
                  showModalBottomSheet<dynamic>(
                      isScrollControlled: true,
                      context: context,
                      shape: RoundedRectangleBorder(
                        // <-- SEE HERE
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10.0.r),
                        ),
                      ),
                      builder: (BuildContext bc) {
                        return BlocProvider<HomePageBloc>.value(
                          value: context.read<HomePageBloc>(),
                          child: AddBottomSheet(),
                        );
                      });
                },
                backgroundColor: MyColors.kPrimaryTextColor,
                child: SvgPicture.asset(
                  "assets/icons/plus_icon.svg",
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
