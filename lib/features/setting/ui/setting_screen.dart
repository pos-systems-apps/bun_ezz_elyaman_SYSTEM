import 'package:flutter/material.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/features/setting/ui/widgets/setting_app_bar_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingAppBarWidget(),


        ],
      ),
    );
  }
}
