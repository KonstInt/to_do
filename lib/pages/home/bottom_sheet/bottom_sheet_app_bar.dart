import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants.dart';

class BottomSheetAppBar extends StatelessWidget {
  const BottomSheetAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                      padding: EdgeInsets.only(top: 10.0.r, bottom: 3.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/back_row.svg",
                                      width: 12.r,
                                      height: 21.r,
                                      color: MyColors.kLinkTextColor,
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      'Close',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: MyColors.kLinkTextColor,
                                              fontSize: 17.sp),
                                    ),
                                  ],
                                )),
                          ),
                          const Spacer(),
                          Text(
                            'Title',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 17.spMax,
                                  color: MyColors.kPrimaryTextColor,
                                ),
                          ),
                          const Spacer(
                            flex: 2,
                          )
                        ],
                      ),
                    );
  }
}
