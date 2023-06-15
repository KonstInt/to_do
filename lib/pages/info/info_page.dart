import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 27.w, top: 25.w),
                        child: Text('Information',
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 27.w, right: 14.w, top: 40.h),
                        child: Text(
                          MyStrings.info+MyStrings.info,
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.24.sp,
                                  color: MyColors.kSecondaryTextColor),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: double.infinity,
                        height: 46.h,
                        margin: EdgeInsets.only(
                            left: 30.r, right: 30.r, bottom: 41.r),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11.58.r),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                MyColors.kPrimaryTextColor),
                          ),
                          child: Text(
                            "Got it!",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: MyColors.kPrimaryLightColor,
                                    fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          );
        }),
      ),
    );
  }
}
