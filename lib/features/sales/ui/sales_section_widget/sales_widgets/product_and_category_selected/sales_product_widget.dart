import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/cached_network_image.dart';
import 'package:pos_system/features/sales/data/models/category_products_response.dart';

class SalesProductWidget extends StatelessWidget {
  final TripProductModel product;
  final bool isSelected;

  const SalesProductWidget({
    required this.product,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasDiscount = product.discount > 0;
    final bool hasImage = product.image != null && product.image!.isNotEmpty;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: isSelected
              ? AppColors.mainColor.withOpacity(.4)
              : AppColors.whiteColor,
          width: isSelected ? 1 : 0,
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
            color: AppColors.blackColor.withOpacity(.1),
          ),
        ],
      ),
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
                alignment: Alignment.center,
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
            )
          else
            SizedBox(height: 20.r),

          verticalSpace(10),

          Expanded(
            child: hasImage
                ? CachedNetworkImageWidget(
              imgUrl: EndPoints.getImageFromApi(
                "product/${product.image}",
              ),
              radius: 0,
            )
                : Icon(
              Icons.inventory_2_outlined,
              size: 45.r,
              color: AppColors.greyColor87,
            ),
          ),

          verticalSpace(10),

          Text(
            product.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyles.font12BlackColorWeight400,
          ),

          verticalSpace(4),

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!hasDiscount)
                  Flexible(
                    child: Text(
                      "جنيه ${product.finalPrice.toStringAsFixed(2)}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font12GreenColor00WeightBold,
                    ),
                  ),

                if (hasDiscount) ...[
                  Flexible(
                    child: Text(
                      product.sellingPrice.toStringAsFixed(2),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font14GreyColor66Weight400.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                  horizontalSpace(4),
                  Flexible(
                    child: Text(
                      "جنيه ${product.finalPrice.toStringAsFixed(2)}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font12GreenColor00WeightBold,
                    ),
                  ),
                ],
              ],
            ),
          ),

          verticalSpace(4),

          Text(
            "كود المنتج : ${product.id}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyles.font12greyColor67Weight500,
          ),

          verticalSpace(4),

          Text(
            "الضريبة : ${product.taxAmount.toStringAsFixed(2)}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyles.font12greyColor67Weight500,
          ),

          verticalSpace(4),

          Text(
            "المخزون : ${product.availableQuantity} ${product.unit?.symbol ?? ''}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyles.font12greyColor67Weight500,
          ),

          verticalSpace(10),
        ],
      ),
    );
  }
}