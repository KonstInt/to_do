import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/utils/constants.dart';
import '../../../navigation/home/home_page_bloc.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("My tasks", style: Theme.of(context).textTheme.titleLarge),
          BlocBuilder<HomePageBloc, HomePageState>(
            builder: (context, state) {
              if (state is HomePageLoadedState) {
                return TextButton(
                  onPressed: () {
                    final homePageBloc = context.read<HomePageBloc>();
                    homePageBloc.add(HomePageHideEvent());
                  },
                  child: Text(
                    state.isHide ? "Show completed" : "Hide completed",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: MyColors.kLinkTextColor),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
