import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:shimmer/shimmer.dart';

class VisitsCarriedOutShimmerWidget extends StatelessWidget {
  const VisitsCarriedOutShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(16),
          _shimmerWidget(),
          verticalSpace(16),
          _shimmerWidget(),
          verticalSpace(16),
          _shimmerWidget(),
          verticalSpace(16),
          _shimmerWidget(),
          verticalSpace(16),
          _shimmerWidget(),
          verticalSpace(16),
          _shimmerWidget(),
          verticalSpace(16),
          _shimmerWidget(),
          verticalSpace(16),
          _shimmerWidget(),
          verticalSpace(16),
          _shimmerWidget(),
          verticalSpace(16),
          _shimmerWidget(),
          verticalSpace(16),
        ],
      ),
    );
  }

  Container _shimmerWidget() {
    return Container(
          height: 120.h,
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
        );
  }
}
