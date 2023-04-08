import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/utils/constants.dart';

class NoItemsWidget extends StatelessWidget {
  const NoItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      SizedBox(height: 30.h),
      SizedBox(
        width: 153.w,
        height: 115.h,
        child: Text(
          "Looks like there is no tasks yet! Go ahead and push a plus button below",
          style:
              Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      SizedBox(height: 8.h),
      Padding(
        padding: EdgeInsets.only(left: 22.w),
        child: SvgPicture.asset(
          "assets/icons/beautiful_amaizing_sexy_oh_my_fucking_god_row.svg",
          color: Theme.of(context).primaryIconTheme.color,
        ),
      )
    ]);
  }
}
