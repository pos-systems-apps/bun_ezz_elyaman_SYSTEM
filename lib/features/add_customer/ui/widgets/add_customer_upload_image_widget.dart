import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/add_customer/logic/add_customer_cubit.dart';
import 'package:pos_system/features/add_customer/logic/add_customer_state.dart';

class AddCustomerUploadImageWidget extends StatelessWidget {
  const AddCustomerUploadImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCustomerCubit, AddCustomersState>(
      buildWhen: (previous, current) {
        return current is OnChangeSelectedImageState;
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AddCustomerCubit.get(context).uploadImage();
          },
          child: DottedBorder(
            borderType: BorderType.RRect,
            dashPattern: [12, 12],
            color: AppColors.blueColorEEE,
            strokeWidth: 1.4,
            radius: Radius.circular(4.r),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
              child: Container(
                height: 132.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: AddCustomerCubit.get(context).selectedImagePath == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(ImageAsset.addImageICon),
                          verticalSpace(4),
                          Text(
                            "قم برفع الصوره",
                            style: TextStyles.font16MainColorWeight500,
                          ),
                        ],
                      )
                    : Image.file(
                        File(AddCustomerCubit.get(context).selectedImagePath!),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
