import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/features/button_navigation/logic/button_navigation_cubit.dart';

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

  List<IconData> iconList = [
    Icons.brightness_5,
    Icons.brightness_4,
    Icons.brightness_6,
    Icons.brightness_7,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.redColor,
      body: Text("data"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.mainColor,
        child: SvgPicture.asset(ImageAsset.scanICon),
        onPressed: () {},
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        ///
        activeIndex: 0,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 12.r,
        rightCornerRadius: 12.r,
        onTap: (index) {
          // setState(( ) {
          //   ButtonNavigationCubit.get(context).changeSelectedTap(index);
          // });
          print(index);
        },
      ),
    );
  }
}
