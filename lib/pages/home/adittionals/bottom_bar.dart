import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants.dart';

class BottomBar extends StatelessWidget {
  final selectedIndex;
  final onItemTapped;
  const BottomBar({super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 66.h,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
                    color: MyColors.kSecondaryTextColor, width: 0.5.r))),
        child: BottomNavigationBar(
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/az_filter.svg",
                width: 28.r,
                color: selectedIndex == 0
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryIconTheme.color,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/za_filter.svg",
                width: 28.r,
                color: selectedIndex == 1
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryIconTheme.color,
              ),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/dt_filter.svg",
                width: 28.r,
                color: selectedIndex == 2
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryIconTheme.color,
              ),
              label: 'School',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
        ),
      );
  }
}