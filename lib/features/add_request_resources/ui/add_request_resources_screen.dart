import 'package:flutter/material.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/add_request_resources/ui/add_request_resources_widgets/add_request_resources_body_widget.dart';

class AddRequestResourcesScreen extends StatelessWidget {
  const AddRequestResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(10),
            Center(
                child: Text(
              "التوريدات",
              style: TextStyles.font20BlueColorA4Weight600,
            )),
            verticalSpace(16),
            AddRequestResourcesBodyWidget(),
          ],
        ),
      ),
    );
  }
}
