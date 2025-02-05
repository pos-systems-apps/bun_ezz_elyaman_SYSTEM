import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/features/button_navigation/entities/button_navigation_items.dart';
import 'package:pos_system/features/button_navigation/logic/button_navigation_cubit.dart';
import 'package:pos_system/features/button_navigation/logic/button_navigation_state.dart';

class ButtonNavigationScreen extends StatefulWidget {
  const ButtonNavigationScreen({super.key});

  @override
  State<ButtonNavigationScreen> createState() => _ButtonNavigationScreenState();
}

class _ButtonNavigationScreenState extends State<ButtonNavigationScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocBuilder<ButtonNavigationCubit, ButtonNavigationState>(
        buildWhen: (previous, current) {
          return current is OnChangeTapState;
        },
        builder: (context, state) {
          return ButtonNavigationCubit.get(context).buttonBarBody();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.mainColor,
        child: SvgPicture.asset(ImageAsset.scanICon),
        onPressed: () {
          ///
          ///
        },
      ),
      bottomNavigationBar:
          BlocBuilder<ButtonNavigationCubit, ButtonNavigationState>(
        buildWhen: (previous, current) {
          return current is OnChangeTapState;
        },
        builder: (context, state) {
          return AnimatedBottomNavigationBar(
            icons: ButtonNavigationItems(
                    items: ButtonNavigationCubit.get(context)
                        .buttonBarItems(context))
                .items
                .map((item) => item.image)
                .toList(),
            titleText: ButtonNavigationItems(
                    items: ButtonNavigationCubit.get(context)
                        .buttonBarItems(context))
                .items
                .map((item) => item.title)
                .toList(),
            titleTextStyle: ButtonNavigationItems(
                    items: ButtonNavigationCubit.get(context)
                        .buttonBarItems(context))
                .items
                .map((item) => item.titleTextStyle)
                .toList(),
            height: 75,
            activeIndex: 0,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.defaultEdge,
            borderColor: AppColors.greyColorBD.withValues(alpha: .2),
            leftCornerRadius: 8.r,
            rightCornerRadius: 8.r,
            onTap: (index) {
              ButtonNavigationCubit.get(context).changeSelectedTap(index);
            },
          );
        },
      ),
    );
  }
}
