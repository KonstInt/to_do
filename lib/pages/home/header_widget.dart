import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/utils/constants.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: EdgeInsets.only(top: 25.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My tasks",
                      style: Theme.of(context).textTheme.titleLarge
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Hide completed",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: MyColors.kLinkTextColor
                            ),
                      ),
                    ),
                  ],
                ),
              );
  }
}