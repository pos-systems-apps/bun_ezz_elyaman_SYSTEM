import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesShimmerWidget extends StatelessWidget {
  const CategoriesShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _shimmerItem(),
          _shimmerItem(),
          _shimmerItem(),
          _shimmerItem(),
          _shimmerItem(),
          _shimmerItem(),
          _shimmerItem(),
        ],
      ),
    );
  }

  Container _shimmerItem() {
    return Container(
      height: 85.h,
      width: 80.w,
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
