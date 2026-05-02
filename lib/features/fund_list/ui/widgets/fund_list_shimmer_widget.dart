// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pos_system/core/utils/spacing.dart';
// import 'package:shimmer/shimmer.dart';
//
// class FundListShimmerWidget extends StatelessWidget {
//   const FundListShimmerWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         verticalSpace(16),
//         _shimmerWidget(),
//         verticalSpace(16),
//         _shimmerWidget(),
//         verticalSpace(16),
//         _shimmerWidget(),
//         verticalSpace(16),
//         _shimmerWidget(),
//         verticalSpace(16),
//       ],
//     );
//   }
//
//   Row _shimmerWidget() {
//     return Row(
//       children: [
//         Expanded(
//           child: Container(
//             height: 30.h,
//             alignment: Alignment.topLeft,
//             child: Shimmer.fromColors(
//               baseColor: Colors.grey.withOpacity(.2),
//               highlightColor: Colors.grey.withOpacity(.4),
//               period: const Duration(seconds: 1),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.grey.withOpacity(.5),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         horizontalSpace(30),
//         Expanded(
//           child: Container(
//             height: 30.h,
//             alignment: Alignment.topLeft,
//             child: Shimmer.fromColors(
//               baseColor: Colors.grey.withOpacity(.2),
//               highlightColor: Colors.grey.withOpacity(.4),
//               period: const Duration(seconds: 1),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.grey.withOpacity(.5),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
