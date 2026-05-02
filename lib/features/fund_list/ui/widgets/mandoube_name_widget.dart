// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:pos_system/core/utils/app_colors_white_theme.dart';
// import 'package:pos_system/core/utils/assets_manager.dart';
// import 'package:pos_system/core/utils/spacing.dart';
// import 'package:pos_system/core/utils/styles.dart';
// import 'package:pos_system/features/fund_list/logic/fund_list_cubit.dart';
//
// class MandoubeNameWidget extends StatelessWidget {
//   const MandoubeNameWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
//       decoration: BoxDecoration(
//         color: AppColors.mainColor.withValues(alpha: .13),
//         borderRadius: BorderRadius.circular(8.r),
//       ),
//       child: Row(
//         children: [
//           SvgPicture.asset(ImageAsset.icon10),
//           horizontalSpace(16),
//           Text(
//             FundListCubit.get(context).seller == null
//                 ? ""
//                 : FundListCubit.get(context).seller!.name,
//             style: TextStyles.font14BlackColorWeight400,
//           )
//         ],
//       ),
//     );
//   }
// }
