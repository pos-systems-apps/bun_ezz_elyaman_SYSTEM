import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/cached_network_image.dart';
import 'package:pos_system/features/sales/data/models/category_products_response.dart';

class SalesProductWidget extends StatelessWidget {
  final Product product;
  final bool isSelected;

  const SalesProductWidget(
      {required this.product, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(
            color: isSelected
                ? AppColors.mainColor.withValues(alpha: .4)
                : AppColors.whiteColor,
            width: isSelected ? 1 : 0,
          ),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 20,
                spreadRadius: 0,
                color: AppColors.blackColor.withValues(alpha: .1)),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isSelected)
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 20.r,
                width: 20.r,
                padding: EdgeInsets.all(2.r),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.mainColor,
                ),
                child: Icon(
                  Icons.check_rounded,
                  color: AppColors.whiteColor,
                  size: 16.r,
                ),
              ),
            ),
          verticalSpace(10),
          Expanded(child: CachedNetworkImageWidget(imgUrl: "", radius: 0)),
          verticalSpace(10),
          Text(
              context.locale.languageCode == "ar"
                  ? product.nameAr
                  : product.nameEn,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyles.font12BlackColorWeight400),
          verticalSpace(4),
          Text("1200 ر.س",
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyles.font12GreenColor00WeightBold),
          verticalSpace(10),
          Text("كود المنتج : ${product.productCode}",
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyles.font12greyColor67Weight500),
          verticalSpace(10),
          Text("المخزون: ${product.quantity}",
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyles.font12greyColor67Weight500),
          verticalSpace(10),
        ],
      ),
    );
  }
}
