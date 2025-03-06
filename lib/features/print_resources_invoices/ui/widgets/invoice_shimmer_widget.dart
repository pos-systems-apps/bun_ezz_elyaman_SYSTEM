import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/widgets/horizontal_dashed_widget.dart';
import 'package:shimmer/shimmer.dart';

class InvoiceShimmerWidget extends StatelessWidget {
  const InvoiceShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        verticalSpace(16),
        Container(
          height: 70.h,
          width: 70.w,
          alignment: Alignment.topLeft,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(.2),
            highlightColor: Colors.grey.withOpacity(.4),
            period: const Duration(seconds: 1),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        verticalSpace(24),
        HorizontalDashedWidget(width: 4, space: 4),
        verticalSpace(24),
        Container(
          height: 10.h,
          alignment: Alignment.topLeft,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(.2),
            highlightColor: Colors.grey.withOpacity(.4),
            period: const Duration(seconds: 1),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        verticalSpace(16),
        Container(
          height: 10.h,
          alignment: Alignment.topLeft,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(.2),
            highlightColor: Colors.grey.withOpacity(.4),
            period: const Duration(seconds: 1),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        verticalSpace(16),
        Container(
          height: 10.h,
          alignment: Alignment.topLeft,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(.2),
            highlightColor: Colors.grey.withOpacity(.4),
            period: const Duration(seconds: 1),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        verticalSpace(24),
        HorizontalDashedWidget(width: 4, space: 4),
        verticalSpace(24),
        Container(
          height: 10.h,
          alignment: Alignment.topLeft,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(.2),
            highlightColor: Colors.grey.withOpacity(.4),
            period: const Duration(seconds: 1),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        verticalSpace(16),
        Container(
          height: 10.h,
          alignment: Alignment.topLeft,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(.2),
            highlightColor: Colors.grey.withOpacity(.4),
            period: const Duration(seconds: 1),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        verticalSpace(16),
        Container(
          height: 10.h,
          alignment: Alignment.topLeft,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(.2),
            highlightColor: Colors.grey.withOpacity(.4),
            period: const Duration(seconds: 1),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        verticalSpace(24),
        HorizontalDashedWidget(width: 4, space: 4),
        verticalSpace(24),
        Container(
          height: 10.h,
          alignment: Alignment.topLeft,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(.2),
            highlightColor: Colors.grey.withOpacity(.4),
            period: const Duration(seconds: 1),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        verticalSpace(16),
        Container(
          height: 10.h,
          alignment: Alignment.topLeft,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(.2),
            highlightColor: Colors.grey.withOpacity(.4),
            period: const Duration(seconds: 1),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        verticalSpace(16),
        Container(
          height: 10.h,
          alignment: Alignment.topLeft,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(.2),
            highlightColor: Colors.grey.withOpacity(.4),
            period: const Duration(seconds: 1),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        verticalSpace(24),
        HorizontalDashedWidget(width: 4, space: 4),
        verticalSpace(24),
        Container(
          height: 10.h,
          alignment: Alignment.topLeft,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(.2),
            highlightColor: Colors.grey.withOpacity(.4),
            period: const Duration(seconds: 1),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        verticalSpace(16),
        Container(
          height: 10.h,
          alignment: Alignment.topLeft,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(.2),
            highlightColor: Colors.grey.withOpacity(.4),
            period: const Duration(seconds: 1),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
