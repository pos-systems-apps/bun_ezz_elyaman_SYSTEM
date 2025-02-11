import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryProductsShimmerWidget extends StatelessWidget {
  const CategoryProductsShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 13.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 1 / 1.3,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return _shimmerItem();
        });
  }

  Container _shimmerItem() {
    return Container(
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
