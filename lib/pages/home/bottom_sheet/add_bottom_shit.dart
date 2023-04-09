import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:to_do/pages/home/bottom_sheet/bottom_sheet_app_bar.dart';
import 'package:to_do/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/todo_item.dart';
import '../../../navigation/add_new_task/add_new_task_bloc.dart';
import '../../../navigation/home/home_page_bloc.dart';

class AddBottomSheet extends StatefulWidget {
  const AddBottomSheet({super.key});

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  final myController = TextEditingController();
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        //myController.clear();
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 39,
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => AddNewTaskBloc(),
            child: BlocListener<AddNewTaskBloc, AddNewTaskState>(
              listener: (context, state) {
                if (state is AddNewTaskLoadedState) {
                  final homePageBloc = context.read<HomePageBloc>();
                  homePageBloc.add(HomePageLoadEvent());
                  Navigator.pop(context);
                } else {
                  //print("Ну пизда");
                }
              },
              child: Builder(builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BottomSheetAppBar(),
                    Divider(
                      thickness: 1.h,
                      height: 0.1.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 37.h, left: 29.h),
                      child: Text(
                        'Add a task',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20.0.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 29.w),
                                child: Text('Name',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 20.sp,
                                            color: MyColors.kPrimaryTextColor)),
                              ),
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 6.5.r, left: 11.w, right: 34.w),
                                  child: TextField(
                                    controller: myController,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      border: const UnderlineInputBorder(),
                                      isDense: true,
                                      hintText: 'Lorem ipsum dolor sit amet',
                                      contentPadding: EdgeInsets.fromLTRB(
                                          10.w, 0, 10.w, 3.h),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 29.w),
                              child: Text('Time',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 20.sp,
                                          color: MyColors.kPrimaryTextColor)),
                            ),
                            SizedBox(
                              width: 22.w,
                            ),
                            TextButton(
                              onPressed: () async {
                                final time = await pickTime();
                                if (time == null) return; // pressed 'CANCEL'
                                final newDateTime = DateTime(
                                  dateTime.year,
                                  dateTime.month,
                                  dateTime.day,
                                  time.hour,
                                  time.minute,
                                ); // DateTime
                                setState(() => dateTime = newDateTime); //
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(11.58.r),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    MyColors.kLiteButtonColor),
                              ),
                              child: SizedBox(
                                height: 28.h,
                                width: 70.w,
                                child: Center(
                                  child: Text(
                                    DateFormat('HH:mm').format(dateTime),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: MyColors.kPrimaryTextColor,
                                            fontSize: 22.sp,
                                            letterSpacing: 0.35),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 29.w),
                              child: Text('Date',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 20.sp,
                                          color: MyColors.kPrimaryTextColor)),
                            ),
                            SizedBox(
                              width: 22.w,
                            ),
                            TextButton(
                              onPressed: () async {
                                final date = await pickDate();
                                if (date == null) return; // pressed 'CANCEL'
                                final newDateTime = DateTime(
                                  date.year,
                                  date.month,
                                  date.day,
                                  dateTime.hour,
                                  dateTime.minute,
                                ); // DateTime
                                setState(() => dateTime = newDateTime); //
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(11.58.r),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    MyColors.kLiteButtonColor),
                              ),
                              child: SizedBox(
                                height: 30.h,
                                width: 160.w,
                                child: Center(
                                  child: Text(
                                    DateFormat('dd.MM.yyyy').format(dateTime),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: MyColors.kPrimaryTextColor,
                                            fontSize: 22.sp,
                                            letterSpacing: 0.35),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 30.w, right: 29.0.w, top: 57.h),
                      child: TextButton(
                        onPressed: myController.text.isEmpty?null:() {
                          final addNewTaskBloc = context.read<AddNewTaskBloc>();
                          addNewTaskBloc.add(
                            AddNewTaskToDbEvent(
                              item: ToDoItemModel(
                                id: -1,
                                isDone: false,
                                title: myController.text,
                                eventDateTime: dateTime,
                              ),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11.58.r),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              myController.text.isEmpty
                                  ? MyColors.kSecondaryTextColor
                                  : MyColors.kPrimaryColor),
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 30.h,
                            width: 160.w,
                            child: Center(
                              child: Text(
                                'Done',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: MyColors.kPrimaryLightColor,
                                        fontSize: 14.06.sp,
                                        letterSpacing: -0.34),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: dateTime,
      lastDate: DateTime(2100));
  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));
}
