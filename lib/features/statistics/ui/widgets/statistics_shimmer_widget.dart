import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:shimmer/shimmer.dart';

class StatisticsShimmerWidget extends StatelessWidget {
  const StatisticsShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 80.h,
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
            ),
            horizontalSpace(16),
            Expanded(
              child: Container(
                height: 80.h,
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
            ),
          ],
        ),
        verticalSpace(16),
        Container(
          height: 250.h,
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
          height: 80.h,
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
          height: 80.h,
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
          height: 80.h,
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
